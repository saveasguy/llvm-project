#include "Extractors.h"

using namespace llvm;
using namespace llvm::optopus;

SimpleBBExtractor::SimpleBBExtractor(const Module &M)
    : MI(M.begin()), ME(M.end()), FI(), FE() {}

SmallVector<const BasicBlock *, 1> SimpleBBExtractor::extract() {
  for (; MI != ME && FI == FE; ++MI) {
    FI = MI->begin();
    FE = MI->end();
  }
  if (FI != FE)
    return {&*FI++};
  return {};
}
