#!/bin/bash

GCC_VERSION="4.3"

export R_BASE=/app/vendor/R
export R_HOME=$R_BASE/lib64/R
export R_INCLUDE=$R_HOME/include
export PATH=$R_BASE/bin:/app/vendor/gcc-$GCC_VERSION/bin:$PATH

# flags for compiling packages
export LDFLAGS="-L/app/vendor/gcc/lib64 -L/app/vendor/gsl/lib"
export CPPFLAGS="-I/app/vendor/glibc/string -I/app/vendor/glibc/time -I/app/vendor/gsl/include"
export PKG_LDFLAGS=$LDFLAGS
export PKG_CPPFLAGS=$CPPFLAGS
