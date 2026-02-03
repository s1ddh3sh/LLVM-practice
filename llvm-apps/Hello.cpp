// #include "clang/Frontend/CompilerInstance.h"
// #include "clang/CodeGen/CodeGenAction.h"

#include "llvm/TargetParser/Host.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Analysis/CFGPrinter.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Transforms/Utils/Mem2Reg.h"
#include "llvm/IRReader/IRReader.h"

// std::unique_ptr<llvm::Module> c2ir(const std::string &filePath, llvm::LLVMContext &llvm_ctx)
// {
//     clang::CompilerInstance compiler;

//     compiler.createDiagnostics();
//     if (!compiler.hasDiagnostics())
//         return nullptr;

//     std::vector<const char *> args = {
//         "clang-tool",
//         "std=c++11",
//         "-O1",
//         "-disable-O0-optnone"};

//     clang::CompilerInvocation::CreateFromArgs(compiler.getInvocation(), args, compiler.getDiagnostics());

//     auto &frontendOpts = compiler.getInvocation().getFrontendOpts();
//     frontendOpts.Inputs.clear();
//     frontendOpts.Inputs.emplace_back(
//         filePath,
//         clang::Language::CXX);

//     compiler.getInvocation().getTargetOpts().Triple = llvm::sys::getDefaultTargetTriple();

//     compiler.setTarget(
//         clang::TargetInfo::CreateTargetInfo(compiler.getDiagnostics(), compiler.getInvocation().getTargetOpts()));

//     compiler.createFileManager();
//     compiler.createSourceManager();

//     auto action = std::make_unique<clang::EmitLLVMOnlyAction>(&llvm_ctx);
//     if (!compiler.ExecuteAction(*action))
//     {
//         return nullptr;
//     }

//     return action->takeModule();
// }
using namespace llvm;

std::unique_ptr<Module> ir2Module(const std::string &filepath, LLVMContext &llvm_ctx)
{

    SMDiagnostic error;
    std::unique_ptr<llvm::Module> module = llvm::parseIRFile(filepath, error, llvm_ctx);
    if (!module)
        return nullptr;

    return module;
}

struct MyFirstPass : PassInfoMixin<MyFirstPass>
{
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &)
    {
        if (F.getName() != "m_vec_mul_add")
        {
            return PreservedAnalyses::all();
        }
        StringRef name = F.getName();
        errs() << "\n\nProcessing Function: \n"
               << name << "\n";
        for (const BasicBlock &b : F)
        {
            for (const Instruction &Iobj : b)
            {
                const Instruction *I = &(Iobj);
                I->print(outs());
                errs() << "\n\n";
                if (auto bop = dyn_cast<BinaryOperator>(I))
                {
                    auto op0 = bop->getOperand(0);
                    auto op1 = bop->getOperand(1);
                    unsigned op = bop->getOpcode();
                    if (op == Instruction::Add || op == Instruction::Mul)
                    {
                        errs() << "\n Add/Mul instruction found: \n";
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
        return PreservedAnalyses::all();
    }
};

void prepare(std::unique_ptr<llvm::Module> &module)
{
    using namespace llvm;

    LoopAnalysisManager LAM;
    FunctionAnalysisManager FAM;
    CGSCCAnalysisManager CGAM;
    ModuleAnalysisManager MAM;

    PassBuilder PB;

    PB.registerModuleAnalyses(MAM);
    PB.registerCGSCCAnalyses(CGAM);
    PB.registerFunctionAnalyses(FAM);
    PB.registerLoopAnalyses(LAM);
    PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);

    FunctionPassManager FPM;
    FPM.addPass(PromotePass());
    FPM.addPass(MyFirstPass());
    // FPM.addPass(CFGPrinterPass());

    ModulePassManager MPM;
    MPM.addPass(createModuleToFunctionPassAdaptor(std::move(FPM)));

    MPM.run(*module, MAM);
}

int main(int argc, char **argv)
{
    if (argc != 2)
        return 1;

    const char *ir_file = argv[1];
    llvm::LLVMContext llvm_ctx;

    std::unique_ptr<llvm::Module> module = ir2Module(ir_file, llvm_ctx);

    prepare(module);

    // module->print(llvm::outs(), nullptr);
}