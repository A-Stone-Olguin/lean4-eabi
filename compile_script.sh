#!/bin/bash

while read -r source_file; do 
    object_file="${source_file%.cpp}.o"
    arm-none-eabi-gcc -c -o "$object_file" -mcpu=cortex-m4 -I. -I ./include -mthumb -mfloat-abi=soft -ffunction-sections -fmessage-length=0 -funsigned-char -funsigned-bitfields -fshort-enums -gdwarf -Os -DNO_EXTRA_OPT -DNDEBUG "$source_file"   
done < runtime_source_files.txt