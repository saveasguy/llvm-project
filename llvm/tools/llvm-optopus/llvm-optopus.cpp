#include "BenchGen.h"
#include "Extractors.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/WithColor.h"
#include "llvm/Support/raw_ostream.h"

#include <string>

namespace llvm {

static cl::OptionCategory OptopusCategory("Optopus Category");
static cl::opt<std::string> Input(cl::Positional, cl::desc("<LLVM IR file>"),
                                  cl::init("-"), cl::cat(OptopusCategory));

static cl::opt<std::string> OutputDirectory("o", cl::desc("Output directory"),
                                            cl::cat(OptopusCategory));

} // namespace llvm

int main(int argc, char **argv) {
  using namespace llvm;
  InitLLVM X(argc, argv);
  cl::HideUnrelatedOptions({&OptopusCategory, &getColorCategory()});
  cl::ParseCommandLineOptions(argc, argv,
                              "llvm compiler options performance fuzzer\n");
  if (Input == "-")
    return 1; // TODO: Support stdin input
  LLVMContext Ctx;
  SMDiagnostic Err;
  auto M = parseIRFile(Input, Err, Ctx);
  if (!M) {
    Err.print(argv[0], errs());
    return 1;
  }
  optopus::BenchGen<optopus::SimpleBBExtractor> BG;
  BG.generate(*M);
  return 0;
}