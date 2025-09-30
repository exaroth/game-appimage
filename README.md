## Game AppImage Template

1. Run setup.py to download latest appimage
2. initialize wineprefix 
```
WINEPREFIX=$PWD/wineprefix ./winedata/wine wineboot
```
3. If game needs xvdk/vulcan drivers, .NET Runtime etc. install dependencies via winetricks by executing:
```
WINEPREFIX=$PWD/wineprefix ./winedata/wine winetricks
```
4. If game has an installer run it via:
```
WINEPREFIX=$PWD/wineprefix ./winedata/wine /path/to/installer.exe
```

5. Copy contents of game directory to `game` dir

6. Update `wrapper` file, set `progEXE` to game executable, optionally update `progName` and contents of `game.desktop` to customize binary parameters

7. Run appimagetool (build.sh)



