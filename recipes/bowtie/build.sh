#!/bin/bash


export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="-rpath ${PREFIX}/lib"
export LIBRARY_PATH="${PREFIX}/lib"
export CPATH="${PREFIX}/include"
make && make install prefix=$PREFIX

PY3_BUILD="${PY_VER%.*}"

PYTHON_FILES="bowtie bowtie-build bowtie-inspect"

if [ $PY3_BUILD -eq 3 ]; then
    for i in $PYTHON_FILES; do 2to3 --write $i; done
fi
