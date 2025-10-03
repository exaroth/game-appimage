#!/bin/sh

if [ ! -f ./AppDir/winedata/wine ]; then
    echo "Missing wine AppImage, run setup.sh first."
    exit 1
fi

WINEPREFIX=$PWD/wineprefix ./AppDir/winedata/wine "$@"
