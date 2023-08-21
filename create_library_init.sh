#!/bin/bash

LIBRARY_NAME=libleanIniteabi.a

IFS=$'\n' read -d '' -r -a OBJECT_FILES < init_object_files.txt

ar rcs $LIBRARY_NAME "${OBJECT_FILES[@]}"