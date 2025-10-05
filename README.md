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
4. If game needs dxvk/vulkan drivers, .NET Runtime etc. install dependencies via winetricks by executing:
```
./run_wine.sh winetricks
```

5. Move contents of game folder to `game` directory

6. Update `AppDir/wrapper` file, set `EXECUTABLE` to the name of game executable as well as `PROGRAM_NAME` to unique game identifier

7. Run `build.sh` to build AppImage, look for generated file in `build` dir

> [!NOTE]
> There are multiple build modes available:
> - __Default__ - This will use provided wineprefix in read only mode, you might need to create custom path mappings (see below) for locations in the filesystem that game writes to.
> - __Writeable wineprefix mode__ - This mode is similar to above but will mount a writeable, persistent copy of the supplied wineprefix in the host filesystem. To enable it add `--rw-mode` when executing `build.sh` script.
> - __Provisioned wineprefix mode__ - When using this mode wineprefix will not be attached to the AppImage, instead it will be generated automatically during first game boot. You can configure the provisioning process by editing `./AppDir/provision_wineprefix.sh` script, eg. to install dxvk and Visual C++ Redist in the wineprefix append 
> ```
> $WINE winetricks dxvk2071 
> $WINE winetricks vcrun2019
> ```
> In order to use this mode add `--provision-mode` when running build script. Using provisioned mode reduces size of the game AppImage size by at least 100MB.
 
Persistent wineprefix directories are stored in `$HOME/.wine_prefixes`
### Custom path mappings

This feature is useful if you want for some game files to be stored outside of the appimage, for example save directory, configuration etc.
In order to create a mapping add a line to `AppDir/override_list` in a form of `<source>:<destination>` where source is path relative to `AppDir` directory (eg. `game/log.log`) and destination is absolute path within host filesystem.

For example given that a game uses `Saves` directory for saving and `config.txt` for configuration you can create a mapping for these by adding following to `override_list` file:

```
game/Saves:$HOME/Documents/my_game/Saves
game/config.txt:$HOME/Documents/my_game/config.txt
```

This works for both files and directories, note however that these have to exist when you build the appimage.

### Troubleshooting

If AppImage fails to run the program try following steps:

- Ensure that game works outside the AppImage, run
```
./run_wine.sh start /d "$PWD/game" "<game_executable>.exe"
```
If the program fails to start, ensure that all required libraries (eg. `dxvk`, `C++ Redistritable`) are installed

- If you're building AppImage using default build type try running it with either `--rw-mode` or `--provision-mode`
 
- Check game directory for obvious folders which might require write access (eg. save or configuration dirs). Use custom path mappings to expose those within local filesystem (see [Custom Path Mappings](#custom-path-mappings) section) as AppImages are read only
 
- If the game still fails to run properly execute:

```
lsof -a +D $PWD/game -r 1  | awk 'NR==1 || $4~/[0-9]+[uw]/'
```
then in another terminal run game using command from step 1 to find out if there are any other files which require write access.


### License
See `LICENSE` file for details
