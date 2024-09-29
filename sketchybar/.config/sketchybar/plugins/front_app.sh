#!/usr/bin/env zsh

ICON_PADDING_RIGHT=5
ICON="$($CONFIG_DIR/plugins/icon_map.sh "$INFO")"

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
sketchybar --set $NAME.name label="$INFO"
