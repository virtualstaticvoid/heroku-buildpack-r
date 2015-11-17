#!/bin/bash

export PATH="$HOME/vendor/R/bin:$HOME/vendor/R/sbin:$HOME/.apt/bin:$HOME/.apt/sbin:$HOME/.apt/usr/bin:$HOME/.apt/usr/sbin:$HOME/bin:$HOME/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH"
export LD_LIBRARY_PATH="$HOME/.apt/usr/lib/libblas:$HOME/.apt/usr/lib/lapack:$HOME/.apt/usr/lib/x86_64-linux-gnu:$HOME/.apt/usr/lib/i386-linux-gnu:$HOME/.apt/usr/lib:$LD_LIBRARY_PATH"
export LIBRARY_PATH="$HOME/.apt/usr/lib/x86_64-linux-gnu:$HOME/.apt/usr/lib/i386-linux-gnu:$HOME/.apt/usr/lib:$LIBRARY_PATH"
export INCLUDE_PATH="$HOME/.apt/usr/include:$INCLUDE_PATH"
export CPATH="$INCLUDE_PATH"
export CPPPATH="$INCLUDE_PATH"
export PKG_CONFIG_PATH="$HOME/vendor/R/lib/pkgconfig:$HOME/.apt/usr/lib/x86_64-linux-gnu/pkgconfig:$HOME/.apt/usr/lib/i386-linux-gnu/pkgconfig:$HOME/.apt/usr/lib/pkgconfig:$PKG_CONFIG_PATH"
export LDFLAGS="-L$HOME/.apt/usr/lib/libblas -L$HOME/.apt/usr/lib/lapack $LDFLAGS"
export R_INCLUDE="$HOME/vendor/R/lib64/R/include"
