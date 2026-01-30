#include "llvm/Passes/PassBuilder.h"
#include "llvm/Plugins/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace
{

    void visitor(Function &F)
    {
        errs() << "Hello from: " << F.getName() << "\n";
        errs() << " number of arguments: " << F.arg_size() << "\n";
    }

    struct Hello : PassInfoMixin<Hello>
    {

        PreservedAnalyses run(Function &F, FunctionAnalysisManager &)
        {
            visitor(F);
            return llvm::PreservedAnalyses::all();
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