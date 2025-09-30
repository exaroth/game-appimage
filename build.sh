#!/bin/sh

mkdir -p build

cp -Rf ./game ./wineprefix/ AppDir

./tmp/appimagetool.AppImage AppDir build/game.AppImage
