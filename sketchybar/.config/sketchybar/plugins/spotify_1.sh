#!/usr/bin/env zsh

# Max number of characters so it fits nicely to the right of the notch
# MAY NOT WORK WITH NON-ENGLISH CHARACTERS

source "$CONFIG_DIR/colors.sh"

# MAX_LENGTH=35
#
# # Logic starts here, do not modify
# HALF_LENGTH=$(((MAX_LENGTH + 1) / 2))
#
# # Spotify JSON / $INFO comes in malformed, line below sanitizes it
# SPOTIFY_JSON="$INFO"
#
# update_track() {
#
#     if [[ -z $SPOTIFY_JSON ]]; then
#         sketchybar --set $NAME icon.color=$TEXT label.drawing=no
#         return
#     fi
#
#     PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')
#
#     if [ $PLAYER_STATE = "Playing" ]; then
#         TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
#         ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"
#
#         TRACK_LENGTH=${#TRACK}
#         ARTIST_LENGTH=${#ARTIST}
#
#         if [ $((TRACK_LENGTH + ARTIST_LENGTH)) -gt $MAX_LENGTH ]; then
#             if [ $TRACK_LENGTH -gt $HALF_LENGTH ] && [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
#
#                 TRACK="${TRACK:0:$((MAX_LENGTH % 2 == 0 ? HALF_LENGTH - 2 : HALF_LENGTH - 1))}…"
#                 ARTIST="${ARTIST:0:$((HALF_LENGTH - 2))}…"
#
#             elif [ $TRACK_LENGTH -gt $HALF_LENGTH ]; then
#                 TRACK="${TRACK:0:$((MAX_LENGTH - ARTIST_LENGTH - 1))}…"
#             elif [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
#                 ARTIST="${ARTIST:0:$((MAX_LENGTH - TRACK_LENGTH - 1))}…"
#             fi
#         fi
#         sketchybar --set $NAME label="TEST ${TRACK}  ${ARTIST}" label.drawing=yes icon.color=$GREEN
#
#     elif [ $PLAYER_STATE = "Paused" ]; then
#         sketchybar --set $NAME icon.color=$TEXT
#     elif [ $PLAYER_STATE = "Stopped" ]; then
#         sketchybar --set $NAME icon.color=$TEXT label.drawing=no
#     else
#         sketchybar --set $NAME icon.color=$TEXT
#     fi
# }
#
# case "$SENDER" in
# "mouse.clicked")
#     osascript -e 'tell application "Spotify" to playpause'
#     ;;
# *)
#     update_track
#     ;;
# esac

update() {
  PLAYING=1
  if [ "$(echo "$INFO" | jq -r '.["Player State"]')" = "Playing" ]; then
    PLAYING=0
    TRACK="$(echo "$INFO" | jq -r .Name | cut -c1-20)"
    ARTIST="$(echo "$INFO" | jq -r .Artist | cut -c1-20)"
    ALBUM="$(echo "$INFO" | jq -r .Album | cut -c1-20)"
  fi

  args=()
  if [ $PLAYING -eq 0 ]; then
    if [ "$ARTIST" == "" ]; then
      args+=(--set music label="$ALBUM: $TRACK" drawing=on icon=􀊄)
    else
      args+=(--set music label="$ARTIST: $TRACK" drawing=on icon=􀊄)
    fi
  else
    args+=(--set music icon=􀊆)
  fi
  sketchybar -m "${args[@]}"
}

update
