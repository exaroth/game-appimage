#!/bin/sh

mkdir -p ./tmp

if [ -f ./AppDir/winedata/wine ]; then
    echo "appimagetool already exists, skipping download..."
else
    curl -# -L -o ./AppDir/winedata/wine https://github.com/mmtrt/WINE_AppImage/releases/download/continuous-stable/wine-stable_10.0-x86_64.AppImage
    chmod +x ./AppDir/winedata/wine
fi

if [ -f ./tmp/appimagetool.AppImage ]; then
    echo "appimagetool already exists, skipping download..."
else
	curl -# -L -o ./tmp/appimagetool.AppImage https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
    chmod +x ./tmp/appimagetool.AppImage 
fi


