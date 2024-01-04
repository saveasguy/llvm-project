#ifndef LLVM_TOOLS_LLVM_OPTOPUS_BENCHGEN_H
#define LLVM_TOOLS_LLVM_OPTOPUS_BENCHGEN_H

#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/Module.h"

#include <memory>
#include <string>
#include <vector>

namespace llvm {

class Module;
class BasicBlock;

namespace optopus {

class BenchGenBase {
public:
  virtual std::vector<std::unique_ptr<Module>> generate(const Module &M) = 0;

protected:
  std::string generateBenchmarkName(const SmallVectorImpl<const BasicBlock *> &BBs) const;
};

template <class ExtractorT>
class BenchGen final : public BenchGenBase {
public:
  std::vector<std::unique_ptr<Module>> generate(const Module &M) override {
    std::vector<std::unique_ptr<Module>> Benchmarks;
    ExtractorT E{M};
    auto BBs = E.extract();
    while (!BBs.empty()) {
      auto NewM = std::make_unique<Module>(generateBenchmarkName(BBs), M.getContext());
      // Get Input and Output variables
      // Gather Input Ptr variables two a single array
      // Add GEP code
      // Match Input Ptr vars with Arg and GEP vars
      // Clone Basic Blocks
      // Gather Output variables by type
      // Add Ptr Args for output variables
      // Add code with GEP + Store instructions after the definition of Output vars
      // Mark function as noinline
      // Create function, which encapsulates original function
      // Dump module
      BBs = E.extract();
    }
    return Benchmarks;
  }
};

} // namespace optopus
} // namespace llvm

#endif
