#!/bin/sh

bg_dir="$HOME/.local/share/backgrounds"
spotlight_img="$bg_dir/spotlight-$(date -Iminute).jpg"
blurred_img="$bg_dir/.spotlight-$(date -Iminute)-blurred.jpg"
today_img="$bg_dir/today.jpg"
today_blurred_img="$bg_dir/today-blurred.jpg"

# cf: https://github.com/ORelio/Spotlight-Downloader/blob/master/SpotlightAPI.md
assetURL=$(curl -s "https://fd.api.iris.microsoft.com/v4/api/selection?&placement=88000820&bcnt=1&country=US&locale=en-US&fmt=json" -A "Mozilla/5.0" | jq -r '.batchrsp.items[0].item | fromjson | .ad.landscapeImage.asset')
curl -s "$assetURL" > "$spotlight_img"

# remove previous
rm -f "$bg_dir/".spotlight-*-blurred.jpg
# blur for lock screens
magick "$spotlight_img" -filter Gaussian -blur 0x24 "$blurred_img"

# symlinks
ln -sf "$spotlight_img" "$today_img"
ln -sf "$blurred_img" "$today_blurred_img"
