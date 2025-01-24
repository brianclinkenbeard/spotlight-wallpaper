# spotlight-wallpaper
A shell script to pull a current, high-resolution wallpaper from Windows Spotlight.

The API for this has been documented in [ORelio/Spotlight-Downloader](https://github.com/ORelio/Spotlight-Downloader/blob/master/SpotlightAPI.md).

## Behavior
The script will pull a current wallpaper from Windows Spotlight to `~/.local/share/backgrounds` with the current timestamp.

ImageMagick is then used to generate a blurred version of the wallpaper for lock screen or login manager usage. All previous blurred images are deleted.

Finally, symlinks are created for `today.jpg` and `today-blurred.jpg`. The symlinks will be replaced by new wallpapers on subsequent runs, however, old images are retained as `spotlight-[timestamp].jpg`.

To run daily, add a cronjob (`crontab -e`):
```cron
0 0 * * * /path/to/script/spotlight-wallpaper.sh
```
