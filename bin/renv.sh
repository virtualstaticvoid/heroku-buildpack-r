#!/bin/bash

APP_DIR="/app"
CHROOT_DIR="$APP_DIR/.root"
TOOLS_DIR="$APP_DIR/.tools"
FAKECHROOT_DIR="$TOOLS_DIR/fakechroot"

export PATH="$FAKECHROOT_DIR/sbin:$FAKECHROOT_DIR/bin:$PATH"
