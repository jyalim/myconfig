#!/usr/bin/env bash

# Installs configuration files to User's home directory
# TODO - Backup files that are being replaced

TARBALL="./configuration_files.tar.gz"
TARGET="$HOME"

tar -C $TARGET -xzvf $TARBALL 
