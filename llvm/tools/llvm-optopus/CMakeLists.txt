set(LLVM_LINK_COMPONENTS
  Core
  IRReader
  Support
  )

  add_llvm_tool(llvm-optopus
    BenchGen.cpp
    Extractors.cpp
    llvm-optopus.cpp
    )