#!/bin/sh

mkdir -p tmp
mkdir -p build
rm -Rf AppDir/wineprefix
rm -Rf AppDir/game

cp -Rf ./game ./wineprefix/ AppDir

# todo update
if [ "$1" = "--rw-mode" ]; then
    echo "Building with RWMODE=ON"
    cat ./AppDir/AppRun.env | sed -e '/^RWMODE/s/[0|1]/1/g' > ./tmp/AppRun.env.tmp
else
    cat ./AppDir/AppRun.env | sed -e '/^RWMODE/s/[0|1]/0/g' > ./tmp/AppRun.env.tmp
fi
cp ./tmp/AppRun.env.tmp ./AppDir/AppRun.env
./tmp/appimagetool.AppImage AppDir build/game.AppImage
