#!/bin/bash

rm llvm-demo
cd build
make
cp llvm-demo ../
cd ..
./llvm-demo