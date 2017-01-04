#!/bin/bash

if [ $(uname) == Darwin ] ; then
    export LDFLAGS="-rpath ${PREFIX}/lib,-headerpad_max_install_names"
    export LIBRARY_PATH="${PREFIX}/lib"
    export CPATH="${PREFIX}/include"
fi
make && make install prefix=$PREFIX

PY3_BUILD="${PY_VER%.*}"

PYTHON_FILES="bowtie bowtie-build bowtie-inspect"

if [ $PY3_BUILD -eq 3 ]; then
    for i in $PYTHON_FILES; do 2to3 --write $i; done
fi
