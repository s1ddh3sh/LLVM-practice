#include <z3++.h>
#include <iostream>
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
using namespace z3;

std::unique_ptr<Module> ir2Module(const std::string &filepath, LLVMContext &llvm_ctx)
{

    SMDiagnostic error;
    std::unique_ptr<llvm::Module> module = llvm::parseIRFile(filepath, error, llvm_ctx);
    if (!module)
        return nullptr;

    return module;
}

std::string getValName(Value* v) {
    if (v->hasName()) return v->getName().str();
    
    std::string temp;
    raw_string_ostream os(temp);
    v->printAsOperand(os, false);
    return temp;
}


void analysis(Module *M, context &z3_ctx)
{
    std::map<Value *, expr> term_store;

    Function *F = M->getFunction("vector_add");
    if (!F)
        return;

    expr PUBLIC = z3_ctx.bool_const("PUBLIC");
    expr SECRET = z3_ctx.bool_const("SECRET");
    auto args = F->arg_begin();
    Value *public_vec = &*(args++);
    Value *secret_vec = &*(args++);

    term_store.insert({public_vec, PUBLIC});
    term_store.insert({secret_vec, SECRET});

    for (auto &BB : *F)
    {
        for (auto &I : BB)
        {

            if (auto *si = dyn_cast<StoreInst>(&I))
            {
                Value *val = si->getValueOperand();
                Value *ptr = si->getPointerOperand();
                if (term_store.count(val))
                {
                    term_store.insert({ptr, term_store.at(val)});
                }
            }

            else if (auto *li = dyn_cast<LoadInst>(&I))
            {
                Value *ptr = li->getPointerOperand();
                if (term_store.count(ptr))
                {
                    term_store.insert({li, term_store.at(ptr)});
                }
            }

            else if (auto *gep = dyn_cast<GetElementPtrInst>(&I))
            {
                Value *ptr = gep->getPointerOperand();
                if (term_store.count(ptr))
                {
                    term_store.insert({gep, term_store.at(ptr)});
                }
            }

            else if (auto *op = dyn_cast<BinaryOperator>(&I))
            {
                Value *lhs = op->getOperand(0);
                Value *rhs = op->getOperand(1);

                expr e_lhs = (term_store.count(lhs)) ? term_store.at(lhs) : z3_ctx.bool_val(false);
                expr e_rhs = (term_store.count(rhs)) ? term_store.at(rhs) : z3_ctx.bool_val(false);

                expr res = e_lhs || e_rhs;
                term_store.insert({op, res});

                // std::cout << "Register add expression: " << res << std::endl;
            }
        }
    }

    for (auto &entry : term_store)
    {
        Value *key = entry.first;
        z3::expr expr = entry.second;

        std::string name = getValName(key);
        std::cout << name << " : "
                  << expr.simplify() << "\n";
    }
}

int main()
{
    LLVMContext llvm_ctx;
    context z3_ctx;
    auto M = ir2Module("../vector_add.ll", llvm_ctx);
    if (M)
        analysis(M.get(), z3_ctx);
    return 0;
}