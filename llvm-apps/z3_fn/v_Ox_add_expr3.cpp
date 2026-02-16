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

static const int O_COLS = 4;

// Helper function to safely get or default init z3::expr from map
z3::expr safe_get(std::map<Value *, z3::expr> &m, Value *k, z3::context &ctx, int width = 4)
{
    auto it = m.find(k);
    if (it != m.end())
        return it->second;
    return ctx.bv_val(0, width);
}

z3::expr gf_add(const z3::expr &a, const z3::expr &b)
{
    return a ^ b;
}

z3::expr gf_mul(z3::context &ctx, const z3::expr &a, const z3::expr &b)
{

    z3::expr p = ctx.bv_val(0, 8);

    z3::expr a_ext = z3::zext(a, 4);
    z3::expr b_ext = z3::zext(b, 4);

    for (int i = 0; i < 4; i++)
    {
        z3::expr bit = a_ext.extract(i, i); // <-- correct API

        z3::expr shifted = z3::shl(b_ext, ctx.bv_val(i, 8));

        p = p ^ z3::ite(bit == ctx.bv_val(1, 1),
                        shifted,
                        ctx.bv_val(0, 8));
    }

    // reduction mod x^4 + x + 1

    z3::expr top = p.extract(7, 4);
    z3::expr low = p.extract(3, 0);

    z3::expr reduced = low ^ top ^ z3::shl(top, ctx.bv_val(1, 4));

    return reduced & ctx.bv_val(0xF, 4);
}

int main()
{

    LLVMContext llvm_ctx;

    SMDiagnostic err;

    auto module = parseIRFile("../mayo.ll", err, llvm_ctx);
    if (!module)
    {
        std::cout << "Failed to load IR\n";
        return 1;
    }

    Function *F = module->getFunction("mayo_sign_signature");
    if (!F)
    {
        std::cout << "Function not found\n";
        return 1;
    }

    // Find for.body112
    BasicBlock *target = nullptr;
    for (auto &BB : *F)
    {
        if (BB.getName() == "for.body112")
        {
            target = &BB;
            break;
        }
    }

    if (!target)
    {
        std::cout << "Block not found\n";
        return 1;
    }

    z3::context ctx;
    z3::sort bv4 = ctx.bv_sort(4);

    z3::func_decl MAT_MUL = ctx.function("MAT_MUL", bv4, bv4, bv4);
    z3::func_decl MAT_ADD = ctx.function("MAT_ADD", bv4, bv4, bv4);

    std::map<Value *, z3::expr> val;
    std::map<Value *, z3::expr> mem;

    // Vdec symbolic
    for (int i = 0; i < 1704; i++)
    {
        mem.insert_or_assign((Value *)(uintptr_t)(0x100000 + i),
                             ctx.bv_const(("Vdec_" + std::to_string(i)).c_str(), 4));
    }

    // O symbolic
    for (int i = 0; i < 2414; i++)
    {
        mem.insert_or_assign((Value *)(uintptr_t)(0x200000 + i),
                             ctx.bv_const(("O_" + std::to_string(i)).c_str(), 4));
    }

    // x symbolic
    for (int i = 0; i < 1848; i++)
    {
        mem.insert_or_assign((Value *)(uintptr_t)(0x300000 + i),
                             ctx.bv_const(("x_" + std::to_string(i)).c_str(), 4));
    }

    for (auto &I : *target)
    {

        if (auto *load = dyn_cast<LoadInst>(&I))
        {

            Value *src = load->getPointerOperand();
            val.insert_or_assign(&I, safe_get(mem, src, ctx, 4));
        }

        else if (auto *store = dyn_cast<StoreInst>(&I))
        {

            z3::expr v = safe_get(val, store->getValueOperand(), ctx, 4);
            Value *dst = store->getPointerOperand();
            mem.insert_or_assign(dst, v);
        }

        else if (auto *bin = dyn_cast<BinaryOperator>(&I))
        {

            z3::expr a = safe_get(val, bin->getOperand(0), ctx, 4);
            z3::expr b = safe_get(val, bin->getOperand(1), ctx, 4);

            z3::expr result = ctx.bv_val(0, 4);
            switch (bin->getOpcode())
            {

            case Instruction::Add:
                result = a + b;
                break;

            case Instruction::Sub:
                result = a - b;
                break;

            case Instruction::Mul:
                result = a * b;
                break;
            }
            val.insert_or_assign(&I, result);
        }

        else if (auto *gep = dyn_cast<GetElementPtrInst>(&I))
        {

            continue;
        }

        else if (auto *call = dyn_cast<CallInst>(&I))
        {

            Function *callee = call->getCalledFunction();
            if (!callee)
                continue;

            std::string name = callee->getName().str();

            /* ===== mat_mul ===== */

            if (name == "mat_mul")
            {

                Value *O_ptr = call->getArgOperand(0);
                Value *x_ptr = call->getArgOperand(1);
                Value *Ox_ptr = call->getArgOperand(2);

                int rows = 8;

                for (int r = 0; r < rows; r++)
                {
                    z3::expr O_sym =
                        ctx.bv_const(("O_row_" + std::to_string(r)).c_str(), 4);

                    z3::expr x_sym =
                        ctx.bv_const(("x_row_" + std::to_string(r)).c_str(), 4);

                    z3::expr result = MAT_MUL(O_sym, x_sym);

                    mem.insert_or_assign(
                        (Value *)(uintptr_t)(0x400000 + r),
                        result);
                }
            }

            else if (name == "mat_add")
            {

                Value *vi_ptr = call->getArgOperand(0);
                Value *Ox_ptr = call->getArgOperand(1);
                Value *s_ptr = call->getArgOperand(2);

                int rows = 8;

                for (int r = 0; r < rows; r++)
                {

                    z3::expr v_sym =
                        ctx.bv_const(("Vdec_" + std::to_string(r)).c_str(), 4);

                    z3::expr Ox_sym =
                        safe_get(mem,
                                 (Value *)(uintptr_t)(0x400000 + r),
                                 ctx, 4);

                    z3::expr result = MAT_ADD(v_sym, Ox_sym);

                    mem.insert_or_assign(
                        (Value *)(uintptr_t)(0x500000 + r),
                        result);
                }
            }
            else if (name == "memcpy")
            {

                Value *dst = call->getArgOperand(0);
                Value *src = call->getArgOperand(1);

                int param_o = 8; // symbolic width

                for (int j = 0; j < param_o; j++)
                {
                    z3::expr x_sym =
                        ctx.bv_const(("x_tail_" + std::to_string(j)).c_str(), 4);

                    mem.insert_or_assign(
                        (Value *)(uintptr_t)(0x600000 + j),
                        x_sym);
                }
            }
        }
    }

    std::cout << "\nSymbolic expressions for s = v + O*x\n\n";
    std::cout << "\n One s vector:\n\n";

    for (int r = 0; r < 8; r++)
    {
        z3::expr head = safe_get(mem, (Value *)(uintptr_t)(0x500000 + r), ctx, 4);
        std::cout << "s[" << r << "] = " << head << "\n";
    }

    for (int j = 0; j < 8; j++)
    {
        z3::expr tail = safe_get(mem, (Value *)(uintptr_t)(0x600000 + j), ctx, 4);
        std::cout << "s[" << (4 + j) << "] = " << tail << "\n";
    }

    return 0;
}