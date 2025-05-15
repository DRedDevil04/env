#!/bin/sh

app_switched() {
  # Get all display IDs
  displays=$(yabai -m query --displays | jq -r '.[].id')

  for m in $displays; do
    # Get visible spaces on this display (spaces where "visible" is true)
    spaces=$(yabai -m query --spaces --display $m | jq -r '.[] | select(.visible==1) | .index')

    for sid in $spaces; do
      # Get list of apps on this space
      apps=$(yabai -m query --windows --space $sid | jq -r '.[].app' | sort | uniq)

      icon_strip=""
      if [ -n "$apps" ]; then
        while IFS= read -r app; do
          icon_strip+=" $($CONFIG_DIR/plugins/icons.sh "$app")"
        done <<< "$apps"
      else
        icon_strip=" —"
      fi

      sketchybar --animate sin 10 --set space.$sid label="$icon_strip"
    done
  done
}

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set $NAME label="$INFO" icon="$($CONFIG_DIR/plugins/icons.sh "$INFO")"
  app_switched
fi

