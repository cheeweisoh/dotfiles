#!/usr/bin/env zsh

update_space() {
    SPACE_ID=$(echo "$INFO" | jq -r '."display-1"')

    # case $SPACE_ID in
    # 1)
    #     ICON=󰅶
    #     ICON_PADDING_LEFT=7
    #     ICON_PADDING_RIGHT=7
    #     ;;
    # *)
    #     ICON=$SPACE_ID
    #     ICON_PADDING_LEFT=9
    #     ICON_PADDING_RIGHT=10
    #     ;;
    # esac

    sketchybar --set $NAME \
        icon=$SPACE_ID \
        icon.padding_left=9 \
        icon.padding_right=10
}

case "$SENDER" in
"mouse.clicked")
    # Reload sketchybar
    sketchybar --remove '/.*/'
    source $HOME/.config/sketchybar/sketchybarrc
    ;;
*)
    update_space
    ;;
esac
