## Game AppImage Template

### Usage

1. Run `setup.py` 

2. Initialize wineprefix 
```
./run_wine.sh wineboot
```
3. If game has an installer run it via:
```
./run_wine.sh /path/to/installer.exe
```
4. If game needs xvdk/vulkan drivers, .NET Runtime etc. install dependencies via winetricks by executing:
```
./run_wine.sh winetricks
```

5. Move contents of game folder to `game` directory

6. Update `AppDir/wrapper` file, set `EXECUTABLE` to the name of game executable as well as `PROGRAM_NAME` to unique game identifier

7. Run `build.sh` to build AppImage, look for generated file in `build` dir

> [!NOTE]
> Some games require writeable wineprefix, if that is the case for your game run build script with
> `--rw-mode` parameter, this will create persistent wineprefix in `$HOME/.wine_prefixes` for the game
> on the first run.
