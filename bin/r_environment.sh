#!/bin/bash

ARCH=`dpkg-architecture -qDEB_HOST_MULTIARCH`
GCC_VERSION=4.8

# $HOME is /app

export PATH="$HOME/vendor/R/bin:$HOME/.apt/usr/bin:$HOME/.apt/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH"
export LIBRARY_PATH="$HOME/.apt/usr/lib/$ARCH:$HOME/.apt/usr/lib:/usr/lib/$ARCH:/usr/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="$HOME/.apt/usr/lib:$HOME/.apt/usr/lib/$ARCH/:$HOME/.apt/usr/lib/gcc/$ARCH/$GCC_VERSION:/usr/lib/gcc/$ARCH/$GCC_VERSION:$HOME/.apt/usr/lib/libblas:$HOME/.apt/usr/lib/lapack:$LD_LIBRARY_PATH"
export LDFLAGS="-L$HOME/.apt/usr/lib -L$HOME/.apt/usr/lib/$ARCH -L$HOME/.apt/usr/lib/gcc/$ARCH/$GCC_VERSION -L$HOME/.apt/usr/lib/libblas -L$HOME/.apt/usr/lib/lapack $LDFLAGS"
export PKG_LIBS="$LDFLAGS $PKG_LIBS"
export PKG_CPPFLAGS="-I$HOME/.apt/usr/include -I$HOME/.apt/usr/include/$ARCH $PKG_CPPFLAGS"
export PKG_CONFIG_PATH="$HOME/vendor/R/lib/pkgconfig:$HOME/.apt/usr/lib/$ARCH/pkgconfig:$HOME/.apt/usr/lib/pkgconfig:$HOME/.apt/usr/share/pkgconfig:$PKG_CONFIG_PATH"
export INCLUDE_PATH="$HOME/.apt/usr/include:$HOME/.apt/usr/include/$ARCH:$INCLUDE_PATH"
export CPATH="$INCLUDE_PATH"
export CPPPATH="$INCLUDE_PATH"
export R_INCLUDE="$HOME/vendor/R/lib64/R/include"
export TCL_LIBRARY="$HOME/.apt/usr/share/tcltk/tcl8.5"
export TK_LIBRARY="$HOME/.apt/usr/share/tcltk/tk8.5"
export CRAN_MIRROR="http://cran.revolutionanalytics.com"
