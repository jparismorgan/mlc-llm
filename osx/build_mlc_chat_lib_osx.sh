#!/bin/bash

set -e
set -u

mkdir -p build/ && cd build/

cmake ../..\
      -DCMAKE_BUILD_TYPE=Release\
      -DCMAKE_OSX_DEPLOYMENT_TARGET=13.0\
      -DCMAKE_BUILD_WITH_INSTALL_NAME_DIR=ON\
      -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON\
      -DCMAKE_INSTALL_PREFIX=.\
      -DCMAKE_CXX_FLAGS="-O3"\
      -DMLC_LLM_INSTALL_STATIC_LIB=ON\
      -DUSE_METAL=ON

make mlc_llm_static
cmake --build . --target install --config release -j
cd ..