#include "z3++.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/TargetParser/Host.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Analysis/CFGPrinter.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/IRReader/IRReader.h"

#include <map>

using namespace llvm;

Function *findFunction(Module &M)
{
    for (Function &F : M)
    {
        if (F.getName() == "mayo_sign_signature")
            return &F;
    }
    return nullptr;
}

std::unique_ptr<Module> ir2Module(const std::string &filepath, LLVMContext &llvm_ctx)
{

    SMDiagnostic error;
    std::unique_ptr<llvm::Module> module = llvm::parseIRFile(filepath, error, llvm_ctx);
    if (!module)
        return nullptr;

    return module;
}

struct SymbolicStore
{
    std::map<llvm::Value *, z3::expr> store;
    z3::context &ctx;

    SymbolicStore(z3::context &c) : ctx(c) {}

    z3::expr &operator[](llvm::Value *key)
    {
        auto it = store.find(key);
        if (it == store.end())
        {
            // If the register isn't found, initialize it as 'public' (false)
            // This prevents the "default constructor" error
            auto res = store.emplace(key, ctx.bool_val(false));
            return res.first->second;
        }
        return it->second;
    }

    // Check if we already have a taint for this value
    bool has(llvm::Value *key)
    {
        return store.find(key) != store.end();
    }

    void printAll()
    {
        for (auto &entry : store)
        {
            Value *key = entry.first;
            z3::expr expr = entry.second;

            std::string name = key->getName().str();
            std::cout << "%" << name << " : "
                      << expr << "\n";
        }
    }
};

void translateToZ3(Function &F, z3::context &ctx)
{
    SymbolicStore value_store(ctx);
    SymbolicStore mem_store(ctx);

    z3::expr secret = ctx.bool_const("SECRET_KEY");
    z3::expr public_val = ctx.bool_val(false);
    z3::expr mask = ctx.bool_const("VINEGAR_MASK");

    for (auto &BB : F)
    {
        for (auto &I : BB)
        {
            // I.print(errs());
           

            if (auto *gep = llvm::dyn_cast<llvm::GetElementPtrInst>(&I))
            {

                Value *base = gep->getPointerOperand();

                z3::expr vt = public_val; // Default to public
                z3::expr mt = public_val; // Default to public
                if (value_store.has(base))
                {
                    vt = value_store[base];
                }
                if (mem_store.has(base))
                {
                    mt = mem_store[base];
                }
                if (!value_store.has(base) && !mem_store.has(base))
                {
                    std::string name = base->getName().str();

                    if (name.find("sk") != std::string::npos)
                    {
                        mt = secret;
                    }
                    else if (name.find("Vdec") != std::string::npos)
                    {
                        mt = mask;
                    }
                }
                value_store[gep] = vt;
                mem_store[gep] = mt;
            }
            if (auto *load = dyn_cast<LoadInst>(&I))
            {
                Value *src = load->getPointerOperand();

                if (mem_store.has(src))
                {
                    value_store[&I] = mem_store[src];
                }
            }

            if (auto *store = dyn_cast<StoreInst>(&I))
            {
                Value *src = store->getValueOperand();
                Value *dst = store->getPointerOperand();

                if (value_store.has(src))
                {
                    mem_store[dst] = value_store[src];
                }
            }

            //     // Handle Function Calls (mat_add, mat_mul, memcpy)
            if (auto *call = llvm::dyn_cast<llvm::CallInst>(&I))
            {

                Function *callee = call->getCalledFunction();
                if (!callee)
                    continue;
                std::string funcName = callee->getName().str();

                if (funcName == "mat_add")
                {
                    // Expression: vi_eph || Ox_sec
                    Value *arg_vi = call->getArgOperand(0); // ptr %115 (vi)
                    Value *arg_Ox = call->getArgOperand(1); // ptr %arraydecay123
                    Value *dest = call->getArgOperand(2);

                    z3::expr vi_taint = ctx.bool_val(false);
                    z3::expr Ox_taint = ctx.bool_val(false);

                    if (mem_store.has(arg_vi))
                        vi_taint = mem_store[arg_vi];

                    if (mem_store.has(arg_Ox))
                        Ox_taint = mem_store[arg_Ox];

                    z3::expr result = vi_taint || Ox_taint;

                    mem_store[dest] = result;

                    if (auto *gep = dyn_cast<GetElementPtrInst>(dest))
                    {
                        Value *base = gep->getPointerOperand();
                        mem_store[base] = result;
                    }
                }

                else if (funcName == "mat_mul")
                {
                    Value *arg_O = call->getArgOperand(0); // ptr %arraydecay117
                    Value *arg_x = call->getArgOperand(1); // ptr %add.ptr120
                    Value *dest = call->getArgOperand(2);

                    z3::expr O_taint = ctx.bool_val(false);
                    z3::expr x_taint = ctx.bool_val(false);

                    if (mem_store.has(arg_O))
                        O_taint = mem_store[arg_O];

                    if (mem_store.has(arg_x))
                        x_taint = mem_store[arg_x];

                    z3::expr result = O_taint || x_taint;

                    mem_store[dest] = result;

                    if (auto *gep = dyn_cast<GetElementPtrInst>(dest))
                    {
                        Value *base = gep->getPointerOperand();
                        mem_store[base] = result;
                    }
                }
                else if (funcName == "memcpy")
                {
                    // memcpy(dest, src, size)
                    llvm::Value *dest = call->getArgOperand(0);
                    llvm::Value *src = call->getArgOperand(1);

                    z3::expr res = ctx.bool_val(false);
                    if (mem_store.has(src))
                        res = mem_store[src];

                    mem_store[dest] = res;
                    if (auto *gep = dyn_cast<GetElementPtrInst>(dest))
                    {
                        Value *base = gep->getPointerOperand();
                        mem_store[base] = res;
                    }
                }
            }
        }
    }
    std::cout << "Value store : \n" << std::endl;
    value_store.printAll();
    std::cout << "\nMem Ptr store : \n" << std::endl;
    mem_store.printAll();
}

int main()
{
    LLVMContext llvm_ctx;

    std::unique_ptr<Module> module = ir2Module("../mayo.ll", llvm_ctx);
    if (!module)
    {
        std::cerr << "Failed to load mayo.ll\n";
        return 1;
    }

    Function *F = findFunction(*module);
    if (!F)
    {
        std::cerr << "mayo_sign_signature not found\n";
        return 1;
    }

    z3::context ctx;

    translateToZ3(*F, ctx);

    return 0;
}