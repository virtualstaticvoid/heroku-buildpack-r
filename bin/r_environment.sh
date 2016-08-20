#!/bin/bash

ARCH=`dpkg-architecture -qDEB_HOST_MULTIARCH`
GCC_VERSION=4.8

export PATH="/app/vendor/R/bin:/app/.apt/usr/bin:/app/.apt/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH"
export LIBRARY_PATH="/app/.apt/usr/lib/$ARCH:/app/.apt/usr/lib:/usr/lib/$ARCH:/usr/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="/app/.apt/usr/lib:/app/.apt/usr/lib/$ARCH/:/app/.apt/usr/lib/gcc/$ARCH/$GCC_VERSION:/usr/lib/gcc/$ARCH/$GCC_VERSION:/app/.apt/usr/lib/libblas:/app/.apt/usr/lib/lapack:$LD_LIBRARY_PATH"
export LDFLAGS="-L/app/.apt/usr/lib -L/app/.apt/usr/lib/$ARCH -L/app/.apt/usr/lib/gcc/$ARCH/$GCC_VERSION -L/app/.apt/usr/lib/libblas -L/app/.apt/usr/lib/lapack $LDFLAGS"
export PKG_LIBS="$LDFLAGS $PKG_LIBS"
export PKG_CPPFLAGS="-I/app/.apt/usr/include -I/app/.apt/usr/include/$ARCH $PKG_CPPFLAGS"
export PKG_CONFIG_PATH="/app/vendor/R/lib/pkgconfig:/app/.apt/usr/lib/$ARCH/pkgconfig:/app/.apt/usr/lib/pkgconfig:/app/.apt/usr/share/pkgconfig:$PKG_CONFIG_PATH"
export INCLUDE_PATH="/app/.apt/usr/include:/app/.apt/usr/include/$ARCH:$INCLUDE_PATH"
export CPATH="$INCLUDE_PATH"
export CPPPATH="$INCLUDE_PATH"
export R_INCLUDE="/app/vendor/R/lib64/R/include"
export TCL_LIBRARY="/app/.apt/usr/share/tcltk/tcl8.5"
export TK_LIBRARY="/app/.apt/usr/share/tcltk/tk8.5"
export CRAN_MIRROR="http://cran.revolutionanalytics.com"
