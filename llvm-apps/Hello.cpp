#include "clang/Frontend/CompilerInstance.h"
#include "clang/CodeGen/CodeGenAction.h"
#include "clang/Frontend/Utils.h"
#include "clang/Driver/Driver.h"
#include "clang/Frontend/CompilerInvocation.h"

#include "llvm/TargetParser/Host.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Analysis/CFGPrinter.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Transforms/Utils/Mem2Reg.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Linker/Linker.h"

#include <memory>

using namespace llvm;

std::unique_ptr<Module> c2ir(const std::vector<std::string> &filepaths, const std::vector<std::string> &includeDirs, LLVMContext &llvm_ctx)
{
    auto composite = std::make_unique<Module>("composite", llvm_ctx);
    Linker linker(*composite);

    for (const auto &filepath : filepaths)
    {
        clang::CompilerInstance compiler;
        compiler.createDiagnostics();

        std::vector<const char *> args = {
            "clang-tool",
            "-O0",
            // "-g",
            // "-fno-builtin",
            // "-fno-freestanding",
            // "-debug-info-kind=limited",
            "-DENABLE_PARAMS_DYNAMIC=ON"};

        auto &CGO = compiler.getInvocation().getCodeGenOpts();
        CGO.setDebugInfo(llvm::codegenoptions::FullDebugInfo);
        CGO.DebugColumnInfo = true;

        std::string resourceDir = "/usr/local/lib/clang/23";

        args.push_back("-resource-dir");
        args.push_back(resourceDir.c_str());

        std::string builtinInclude = resourceDir + "/include";
        args.push_back("-internal-isystem");
        args.push_back(strdup(builtinInclude.c_str()));
        args.push_back("-isystem");
        args.push_back("/usr/include");
        args.push_back("-isystem");
        args.push_back("/usr/include/x86_64-linux-gnu");
        args.push_back("-isystem");
        args.push_back("/usr/local/include");
        for (const auto &dir : includeDirs)
        {
            args.push_back("-I");
            args.push_back(dir.c_str());
        }

        clang::CompilerInvocation::CreateFromArgs(compiler.getInvocation(), args, compiler.getDiagnostics());

        auto &HSO = compiler.getHeaderSearchOpts();
        HSO.UseBuiltinIncludes = true;
        HSO.UseStandardSystemIncludes = true;
        HSO.UseStandardCXXIncludes = false;

        // compiler.getHeaderSearchOpts().Verbose = true;

        auto &frontendOpts = compiler.getInvocation().getFrontendOpts();
        frontendOpts.Inputs.clear();
        frontendOpts.Inputs.emplace_back(
            filepath,
            clang::Language::C);
        compiler.getInvocation().getTargetOpts().Triple = llvm::sys::getDefaultTargetTriple();

        compiler.createFileManager();
        compiler.createSourceManager();

        compiler.setTarget(
            clang::TargetInfo::CreateTargetInfo(compiler.getDiagnostics(), compiler.getInvocation().getTargetOpts()));

        auto action = std::make_unique<clang::EmitLLVMOnlyAction>(&llvm_ctx);
        if (!compiler.ExecuteAction(*action))
        {
            return nullptr;
        }

        std::unique_ptr<Module> mod = action->takeModule();
        if (linker.linkInModule(std::move(mod)))
        {
            return nullptr;
        }
    }
    return composite;
}

std::unique_ptr<Module> ir2Module(const std::string &filepath, LLVMContext &llvm_ctx)
{

    SMDiagnostic error;
    std::unique_ptr<llvm::Module> module = llvm::parseIRFile(filepath, error, llvm_ctx);
    if (!module)
        return nullptr;

    return module;
}

class MyFirstPass : public PassInfoMixin<MyFirstPass>
{
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &)
    {
        if (F.getName() != "decode")
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
    // if (argc != 2)
    //     return 1;

    // const char *ir_file = argv[1];

    // std::unique_ptr<llvm::Module> module = ir2Module(ir_file, llvm_ctx);

    std::vector<std::string> files = {
        "../example.c",
        "../../src/mayo.c"};

    // 2. Define your include paths (replaces -I)
    std::vector<std::string> includes = {
        "../../include",
        "../../src",
        "../../src/common",
        "../../src/generic"};

    llvm::LLVMContext llvm_ctx;
    std::unique_ptr<llvm::Module> module = c2ir(files, includes, llvm_ctx);

    if (llvm::verifyModule(*module, &llvm::errs()))
    {
        llvm::errs() << "Invalid module\n";
        return 1;
    }

    std::error_code EC;
    llvm::raw_fd_ostream outFile("../mayo.ll", EC);

    if (EC)
    {
        llvm::errs() << "Cannot open mayo.ll: " << EC.message() << "\n";
    }
    else
    {
        module->print(outFile, nullptr);
        llvm::outs() << "Successfully wrote mayo.ll\n";
    }
    // prepare(module);
}