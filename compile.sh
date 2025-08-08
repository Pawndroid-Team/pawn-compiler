#!/bin/bash

NDK_PATH="/root/android-ndk-r28c"
API_LEVEL=21
BUILD_TYPE="Release"
STL_TYPE="c++_shared"

ABIS=("armeabi-v7a" "arm64-v8a" "x86" "x86_64")

rm -rf build
rm -rf bin

for ABI in "${ABIS[@]}"; do
    echo "========================================"
    echo "Building for $ABI"
    echo "========================================"
    
    OUTPUT_DIR="bin/$ABI"
    mkdir -p $OUTPUT_DIR
    
    cmake \
        -DCMAKE_TOOLCHAIN_FILE=$NDK_PATH/build/cmake/android.toolchain.cmake \
        -DANDROID_NDK=$NDK_PATH \
        -DANDROID_ABI=$ABI \
        -DANDROID_PLATFORM=android-$API_LEVEL \
        -DANDROID_STL=$STL_TYPE \
        -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
        -DCMAKE_LIBRARY_OUTPUT_DIRECTORY=$OUTPUT_DIR ./source/compiler \
        -B build/$ABI .
    
    cmake --build build/$ABI
done
