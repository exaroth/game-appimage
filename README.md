## Game AppImage Template

### Usage

1. Run `setup.py` 

2. Initialize wineprefix 
```
WINEPREFIX=$PWD/wineprefix ./winedata/wine wineboot
```

3. If game needs xvdk/vulkan drivers, .NET Runtime etc. install dependencies via winetricks by executing:
```
WINEPREFIX=$PWD/wineprefix ./winedata/wine winetricks
```
4. If game has an installer run it via:
```
WINEPREFIX=$PWD/wineprefix ./winedata/wine /path/to/installer.exe
```

5. Move contents of game folder to `game` directory

6. Update `AppDir/wrapper` file, set `progEXE` to the name of game executable as well as `progName` to unique game identifier

7. Run `build.sh` to build AppImage, look for generated file in `build` dir

> [!NOTE]
> Some games require writeable wineprefix, if that is the case for your game run build script with
> `--rw-mode` parameter, this will create persistent wineprefix in `$HOME/.wine_prefixes` for the game
> on the first run.
