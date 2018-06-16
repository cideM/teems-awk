#!/bin/zsh

# Get the correct theme
theme=`cat $1 | ./get_theme.awk -v theme_name=$2`

if [ -z "$theme" ]; then
    echo "theme $2 not found"
    exit 1;
fi

# Get length of parsed theme and remove the whitespace from wc
len=`echo $theme | wc -l | awk '{ print $1 }'`

# It's not a good safety check but this is just a proof of concept anyway
if [ "$len" != "18" ]; then
    echo "theme does not have enough colors"
    exit 1;
fi

# alacritty
echo "alacritty"

# Transform the #FFFFFF rgb values to '0xFFFFFF', which alacritty uses
alacritty_theme=`echo $theme | sed -E "s/#([0-9a-zA-Z]*)/'0x\1'/"`

# Pipe the theme colors and the config file into awk and replace the current
# colors, with the new ones from the theme.
./get_colors_alacritty.awk \
    <(echo "$alacritty_theme") \
    <(cat ~/.config/alacritty/alacritty.yml) > tmp_alacritty

mv tmp_alacritty ~/.config/alacritty/alacritty.yml

# kitty
echo "kitty"

./get_colors_kitty.awk \
    <(echo "$theme") \
    <(cat ~/.config/kitty/kitty.conf) > tmp_kitty

mv tmp_kitty ~/.config/kitty/kitty.conf
