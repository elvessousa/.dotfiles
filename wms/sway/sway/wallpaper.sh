#!/bin/bash

# Gets GNOME's desktop background
picture_uri="$(dconf read /org/gnome/desktop/background/picture-uri)"
url_to_path=${picture_uri//file:\/\//}
wallpaper=${url_to_path//%20/\\ }

# echo $wallpaper
# Changes Sway desktop background
swaymsg output $1 bg $wallpaper fill
