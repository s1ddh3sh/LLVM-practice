#include "llvm/Passes/PassBuilder.h"
#include "llvm/Plugins/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/BasicBlock.h"

using namespace llvm;

namespace
{

    void visitor(Function &F)
    {
        StringRef name = F.getName();
        errs() << "\nProcessing Function: \n"
               << name << "\n";
        for (const BasicBlock &b : F)
        {
            for (const Instruction &Iobj : b)
            {
                const Instruction *I = &(Iobj);
                I->print(outs());
                if (auto bop = dyn_cast<BinaryOperator>(I))
                {
                    auto op0 = bop->getOperand(0);
                    auto op1 = bop->getOperand(1);
                    unsigned op = bop->getOpcode();
                    if (op == Instruction::Add)
                    {
                        errs() << "\n Add instruction found: \n";
                        bop->print(outs());
                        errs() << "\ninput 0 : \n";
                        op0->print(outs());
                        errs() << "\ninput 1 : \n";
                        op1->print(outs());
                        errs() << "\n";
                    }
                }
            }
        }
        // errs() << "Hello from: " << F.getName() << "\n";
        // errs() << " number of arguments: " << F.arg_size() << "\n";
    }

    struct Hello : PassInfoMixin<Hello>
    {

        PreservedAnalyses run(Function &F, FunctionAnalysisManager &)
        {
            visitor(F);
            return PreservedAnalyses::all();
        }
    };
}

llvm::PassPluginLibraryInfo getHelloWorldPluginInfo()
{
    return {LLVM_PLUGIN_API_VERSION, "Hello", LLVM_VERSION_STRING,
            [](PassBuilder &PB)
            {
                PB.registerPipelineParsingCallback(
                    [](StringRef Name, FunctionPassManager &FPM,
                       ArrayRef<PassBuilder::PipelineElement>)
                    {
                        if (Name == "hello")
                        {
                            FPM.addPass(Hello());
                            return true;
                        }
                        return false;
                    });
            }};
}

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo()
{
    return getHelloWorldPluginInfo();
}