## :video_game: :package: :gear: Game AppImage Builder

Game AppImage Builder is a simple tool that makes it easy to create portable and self contained windows game appimages running on Wine.

- Small size overhead thanks to use of compact wine appimage by [mmtrt](https://github.com/mmtrt/WINE_AppImage) (~200MB)
- Ability to define custom path mappings for the game
- Support for both idempotent and writeable winprefixes

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
>
 
### Custom path mappings

This feature is useful if you want for some game files to be stored outside of the appimage, for example save directory, configuration etc.
In order to create a mapping add a line to `AppDir/override_list` in a form of `<source>:<destination>` where source is path relative to `AppDir` directory (eg. `game/log.log`) and destination is absolute path within host filesystem.

For example given that a game uses `Saves` directory for saving and `config.txt` for configuration you can create a mapping for these by adding following to `override_list` file:

```
game/Saves:$HOME/Documents/my_game/Saves
game/config.txt:$HOME/Documents/my_game/config.txt
```

This works for both files and directories, note however that these have to exist when you build the appimage.
