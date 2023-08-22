#!/bin/bash

while read -r source_file; do 
    object_file="${source_file%.cpp}.o"
    arm-none-eabi-g++ -c -o "$object_file" -mcpu=cortex-m0 -I. -DNO_EXTRA_OPT -mthumb -mfloat-abi=soft -ffunction-sections -gdwarf-2 -fPIC -fvisibility=hidden -isystem -L/home/beth-c132/.elan/toolchains/leanprover--lean4---nightly-2023-06-20/lib -L/home/beth-c132/.elan/toolchains/leanprover--lean4---nightly-2023-06-20/lib/glibc -L/home/beth-c132/.elan/toolchains/leanprover--lean4---nightly-2023-06-20/lib/lean  -Wl,as-needed -static-libgcc -Wl,-Bstatic -lgmp -lunwind -Wl,-Bdynamic -Wl,--no-as-needed -fuse-ld=lld -Wl,--start-group -lleancpp -lLean -Wl,--end-group -Wl,--start-group -lInit -lleanrt -Wl,--end-group -Wl,-Bstatic -lc++ -lc++abi -Wl,-Bdynamic -Wl,--as-needed -lgmp -Wl,--no-as-needed -lm -ldl -lleanshared -Wno-unused-command-line-argument -Os -DNDEBUG "$source_file" -I ./include
done < runtime_source_files.txt