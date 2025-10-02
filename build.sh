#!/bin/sh

rm -Rf AppDir/wineprefix AppDir/game AppDir/overrides
mkdir -p tmp build AppDir/overrides

cp -Rf ./game ./wineprefix/ AppDir

while read -r p; do
  src="$(echo "$p" | cut -d ':' -f1)"
  if [ ! -e "$src" ]; then
      echo "doesnt exist!"
      continue
  fi

  mkdir -p "AppDir/overrides/$(dirname $src)"
  mv "$src" "AppDir/overrides/$(dirname $src)"
  ln -s "/tmp/.game_overrides/$src" "$src"
done < AppDir/override_list

# todo update
if [ "$1" = "--rw-mode" ]; then
    echo "Building with RWMODE=ON"
    cat ./AppDir/AppRun.env | sed -e '/^RWMODE/s/[0|1]/1/g' > ./tmp/AppRun.env.tmp
else
    cat ./AppDir/AppRun.env | sed -e '/^RWMODE/s/[0|1]/0/g' > ./tmp/AppRun.env.tmp
fi
cp ./tmp/AppRun.env.tmp ./AppDir/AppRun.env
./tmp/appimagetool.AppImage AppDir build/game.AppImage
