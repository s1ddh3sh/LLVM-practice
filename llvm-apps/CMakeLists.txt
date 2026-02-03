cmake_minimum_required(VERSION 3.20)

project(llvm-demo)

find_package(LLVM REQUIRED CONFIG)
find_package(Clang REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
message(STATUS "Using ClangConfig.cmake in: ${Clang_DIR}")

# LLVM setup
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# Clang includes
include_directories(${CLANG_INCLUDE_DIRS})


add_executable(llvm-demo Hello.cpp)

# Link Clang *components*
target_link_libraries(llvm-demo
  PRIVATE
  clangFrontend
  clangDriver
  clangSerialization
  clangCodeGen
  clangParse
  clangSema
  clangAnalysis
  clangAST
  clangASTMatchers
  clangEdit
  clangLex
  clangBasic
)

