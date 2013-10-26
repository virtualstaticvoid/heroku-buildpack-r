#!/bin/bash

GCC_VERSION="4.8"

export R_HOME=/app/vendor/R
export R_INCLUDE=$R_HOME/lib64/R/include
export PATH=$R_HOME/bin:/app/vendor/gcc-$GCC_VERSION/bin:$PATH
