#!/bin/bash

read -p "This will reset all the changes you made, are you sure? " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -Rf ./game ./wineprefix
    rm -Rf ./AppDir/game ./AppDir/wineprefix
    git reset --hard origin/main
fi
