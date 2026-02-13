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

struct SymbolicStore
{
    std::map<llvm::Value *, z3::expr> store;
    z3::context &ctx;

    SymbolicStore(z3::context &c) : ctx(c) {}

    z3::expr &operator[](Value *key)
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

    // void insert_or_assign(Value *key, z3::expr expr) {
    //     auto it = store.find(key);
    //     if(it == store.end()) {

    //     } else {
    //         store[key] = expr;
    //     }
    // }
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

void z3_analysis(Function &F, z3::context &ctx)
{
    SymbolicStore term_store(ctx);
    std::map<Value *, Value *> pointsTo;
    z3::expr secret = ctx.bool_const("SECRET_KEY");
    z3::expr public_val = ctx.bool_val(false);
    z3::expr mask = ctx.bool_const("VINEGAR_MASK");

    for (auto &arg : F.args())
    {
        pointsTo[&arg] = &arg;
        z3::expr res = public_val;

        term_store[&arg] = res;
    }

    for (auto &BB : F)
    {
        for (auto &I : BB)
        {
            // Seed allocas and arguments as memory roots
            if (auto *allocaInst = dyn_cast<AllocaInst>(&I))
            {
                pointsTo[allocaInst] = allocaInst;
                z3::expr res = public_val;
                std::string name = allocaInst->getName().str();
                if (name.find("sk") != std::string::npos)
                {
                    res = secret;
                }
                else if (name.find("Vdec") != std::string::npos)
                {
                    res = mask;
                }
                term_store[allocaInst] = res;
            }
        }
    }

    for (auto &BB : F)
    {
        for (auto &I : BB)
        {
            // I.print(errs());

            if (auto *gep = llvm::dyn_cast<GetElementPtrInst>(&I))
            {
                Value *base = gep->getPointerOperand();
                pointsTo[gep] = pointsTo[base];
            }

            if (auto *load = dyn_cast<LoadInst>(&I))
            {
                Value *src = load->getPointerOperand();
                term_store[load] = term_store[pointsTo[src]];
            }

            if (auto *store = dyn_cast<StoreInst>(&I))
            {
                Value *src = store->getValueOperand();
                Value *dst = store->getPointerOperand();
                if (src->getType()->isPointerTy())
                    pointsTo[dst] = pointsTo[src];
                else
                    term_store[pointsTo[dst]] = term_store[src];
            }

            if (auto *binOp = dyn_cast<BinaryOperator>(&I))
            {
                Value *op1 = binOp->getOperand(0);
                Value *op2 = binOp->getOperand(1);

                z3::expr t1 = term_store[op1];
                z3::expr t2 = term_store[op2];

                z3::expr result = t1 || t2;

                term_store[binOp] = result;
            }

            if (auto *call = llvm::dyn_cast<llvm::CallInst>(&I))
            {

                Function *callee = call->getCalledFunction();
                if (!callee)
                    continue;
                std::string funcName = callee->getName().str();

                if (funcName == "mat_add")
                {
                    Value *vi = call->getArgOperand(0); // ptr %115 (vi)
                    Value *Ox = call->getArgOperand(1); // ptr %arraydecay123
                    Value *dest = call->getArgOperand(2);

                    term_store[pointsTo[dest]] = term_store[pointsTo[vi]] || term_store[pointsTo[Ox]];
                }

                else if (funcName == "mat_mul")
                {
                    Value *O = call->getArgOperand(0); // ptr %arraydecay117
                    Value *x = call->getArgOperand(1); // ptr %add.ptr120
                    Value *dest = call->getArgOperand(2);

                    term_store[pointsTo[dest]] = term_store[pointsTo[O]] || term_store[pointsTo[x]];
                }
                else if (funcName == "memcpy")
                {
                    // memcpy(dest, src, size)
                    Value *dest = call->getArgOperand(0);
                    Value *src = call->getArgOperand(1);

                    term_store[pointsTo[dest]] = term_store[pointsTo[src]];
                }
            }
        }
    }

    term_store.printAll();
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

    z3_analysis(*F, ctx);

    return 0;
}