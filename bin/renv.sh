#!/bin/bash

APP_DIR="/app"
CHROOT_DIR="$APP_DIR/.root"
TOOLS_DIR="$APP_DIR/.tools"
FAKECHROOT_DIR="$TOOLS_DIR/fakechroot"

# this makes no sense, but within the chroot, it works
export LD_LIBRARY_PATH="/app/.root/usr/lib:/app/.root/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/share/pkgconfig:$PKG_CONFIG_PATH"
export PATH="$FAKECHROOT_DIR/sbin:$FAKECHROOT_DIR/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
