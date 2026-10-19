#!/bin/sh
# Install patched au0828 (DVB-only media controller fix) via DKMS and reload it.
set -e
NAME=au0828-fusionhdtv7
VER=1.0
SRC=/usr/src/$NAME-$VER
cd "$(dirname "$0")/driver"

dkms remove $NAME/$VER --all 2>/dev/null || true
rm -rf "$SRC"
mkdir -p "$SRC"
cp *.c *.h Makefile dkms.conf "$SRC/"
dkms add $NAME/$VER
dkms install $NAME/$VER

modprobe -r au0828 || { echo "au0828 in use; close DVB apps and retry or replug the device"; exit 1; }
modprobe au0828
modinfo -n au0828
