#include "BenchGen.h"

#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Module.h"

#include <cassert>
#include <cstddef>
#include <sstream>

using namespace llvm;
using namespace llvm::optopus;

namespace {

size_t getIdx(const Function &F) {
  size_t Idx = 0;
  for (auto &&MF : *F.getParent()) {
    if (&MF == &F)
      break;
    ++Idx;
  }
  return Idx;
}

size_t getIdx(const BasicBlock &BB) {
  size_t Idx = 0;
  for (auto &&FBB : *BB.getParent()) {
    if (&FBB == &BB)
      break;
    ++Idx;
  }
  return Idx;
}

} // namespace

std::string BenchGenBase::generateBenchmarkName(
    const SmallVectorImpl<const BasicBlock *> &BBs) const {
  assert(!BBs.empty() && "There has to be at least a single basic block!");
  const auto *F = BBs.front()->getParent();
  const auto *M = F->getParent();
  std::ostringstream BenchmarkName;
  BenchmarkName << M->getName().str() << ".";
  if (F->hasName())
    BenchmarkName << F->getName().str();
  else
    BenchmarkName << getIdx(*F);
  for (const auto *BB : BBs) {
    BenchmarkName << ".";
    if (BB->hasName())
      BenchmarkName << BB->getName().str();
    else
      BenchmarkName << getIdx(*BB);
  }
  return BenchmarkName.str();
}
