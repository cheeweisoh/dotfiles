#!/usr/bin/env zsh

source "$CONFIG_DIR/colors.sh"

MAX_LENGTH=20
HALF_LENGTH=$(((MAX_LENGTH + 1) / 2))
SPOTIFY_JSON="$INFO"

update_track() {
    PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')

    if [ $PLAYER_STATE = "Playing" ]; then
        TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
        ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"


        TRACK_LENGTH=${#TRACK}
        ARTIST_LENGTH=${#ARTIST}

        if [ $((TRACK_LENGTH + ARTIST_LENGTH)) -gt $MAX_LENGTH ]; then
            if [ $TRACK_LENGTH -gt $HALF_LENGTH ] && [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then

                TRACK="${TRACK:0:$((MAX_LENGTH % 2 == 0 ? HALF_LENGTH - 2 : HALF_LENGTH - 1))}…"
                ARTIST="${ARTIST:0:$((HALF_LENGTH - 2))}…"

            elif [ $TRACK_LENGTH -gt $HALF_LENGTH ]; then
                TRACK="${TRACK:0:$((MAX_LENGTH - ARTIST_LENGTH - 1))}…"
            elif [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
                ARTIST="${ARTIST:0:$((MAX_LENGTH - TRACK_LENGTH - 1))}…"
            fi
        fi
        sketchybar --set $NAME label="${TRACK}  ${ARTIST}" label.drawing=yes icon.color=$GREEN
    elif [ $PLAYER_STATE = "Paused" ]; then
        sketchybar --set $NAME icon.color=$TEXT
    elif [ $PLAYER_STATE = "Stopped" ]; then
        sketchybar --set $NAME icon.color=$TEXT label.drawing=no
    else
        sketchybar --set $NAME icon.color=$TEXT
    fi
}

update_track

# case "$SENDER" in
# "mouse.clicked")
#     osascript -e 'tell application "Spotify" to playpause'
#     ;;
# *)
#     update_track
#     ;;
# esac
