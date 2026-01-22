#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace
{

    struct HelloPass : PassInfoMixin<HelloPass>
    {
        PreservedAnalyses run(Function &F, FunctionAnalysisManager &)
        {
            unsigned BBCount = 0;
            unsigned InstCount = 0;

            for (auto &BB : F)
            {
                BBCount++;
                InstCount += BB.size();
            }
            errs() << "Function: " << F.getName() << "\n";
            errs() << "  Basic blocks: " << BBCount << "\n";
            errs() << "  Instructions: " << InstCount << "\n";

            return PreservedAnalyses::all();
        }
    };

}

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo()
{
    return {
        LLVM_PLUGIN_API_VERSION,
        "HelloPass",
        LLVM_VERSION_STRING,
        [](PassBuilder &PB)
        {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, FunctionPassManager &FPM,
                   ArrayRef<PassBuilder::PipelineElement>)
                {
                    if (Name == "hello-pass")
                    {
                        FPM.addPass(HelloPass());
                        return true;
                    }
                    return false;
                });
        }};
}