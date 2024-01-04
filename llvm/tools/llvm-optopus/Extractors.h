#ifndef LLVM_TOOLS_LLVM_OPTOPUS_EXTRACTORS_H
#define LLVM_TOOLS_LLVM_OPTOPUS_EXTRACTORS_H

#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"

namespace llvm {
namespace optopus {

class SimpleBBExtractor {
public:
  SimpleBBExtractor(const Module &M);

  SmallVector<const BasicBlock *, 1> extract();

private:
  Module::const_iterator MI;
  Module::const_iterator ME;
  Function::const_iterator FI;
  Function::const_iterator FE;
};

} // namespace optopus
} // namespace llvm

#endif