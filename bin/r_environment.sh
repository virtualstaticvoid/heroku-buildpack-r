#!/bin/bash

GCC_VERSION="4.3"

export R_HOME=/app/vendor/R
export R_INCLUDE=$R_HOME/lib64/R/include
export PATH=$R_HOME/bin:/app/vendor/gcc-$GCC_VERSION/bin:$PATH

# flags for compiling packages
export PKG_LDFLAGS="-L/app/vendor/gsl/lib"
export PKG_CPPFLAGS="-I/app/vendor/gsl/include"
