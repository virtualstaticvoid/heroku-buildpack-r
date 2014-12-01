#!/bin/bash

export R_INCLUDE="/app/vendor/R/lib64/R/include"
export PATH="/app/vendor/R/bin:/app/vendor/.apt/usr/bin:/app/bin:/usr/ruby1.9.2/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export LD_LIBRARY_PATH="/app/vendor/.apt/usr/lib/libblas:/app/vendor/.apt/usr/lib/lapack:/app/vendor/.apt/usr/lib/x86_64-linux-gnu:/app/vendor/.apt/usr/lib/i386-linux-gnu:/app/vendor/.apt/usr/lib:$LD_LIBRARY_PATH"
export LIBRARY_PATH="/app/vendor/.apt/usr/lib/x86_64-linux-gnu:/app/vendor/.apt/usr/lib/i386-linux-gnu:/app/vendor/.apt/usr/lib:$LIBRARY_PATH"
export INCLUDE_PATH="/app/vendor/.apt/usr/include:$INCLUDE_PATH"
export CPATH="$INCLUDE_PATH"
export CPPPATH="$INCLUDE_PATH"
export PKG_CONFIG_PATH="/app/vendor/.apt/usr/lib/x86_64-linux-gnu/pkgconfig:/app/vendor/.apt/usr/lib/i386-linux-gnu/pkgconfig:/app/vendor/.apt/usr/lib/pkgconfig:$PKG_CONFIG_PATH"
export LDFLAGS="-L/app/vendor/.apt/usr/lib/libblas -L/app/vendor/.apt/usr/lib/lapack $LDFLAGS"
