#!/bin/bash

read -p "This will reset all the changes you made, are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -Rf ./game ./wineprefix
    git reset --hard origin/main
fi
