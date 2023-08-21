#!/bin/bash

LIBRARY_NAME=libleanrteabi.a

IFS=$'\n' read -d '' -r -a OBJECT_FILES < runtime_object_files.txt

ar rcs $LIBRARY_NAME "${OBJECT_FILES[@]}"