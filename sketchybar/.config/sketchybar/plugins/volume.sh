#!/usr/bin/env zsh

case ${INFO} in
0)
    ICON=""
    ICON_PADDING_RIGHT=6
    LABEL="MUTE"
    ;;
[0-9])
    ICON=""
    ICON_PADDING_RIGHT=12
    LABEL="$INFO%"
    ;;
*)
    ICON=""
    ICON_PADDING_RIGHT=6
    LABEL="$INFO%"
    ;;
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT label=$LABEL
