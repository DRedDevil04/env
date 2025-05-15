#!/bin/bash

sketchybar --add event yabai_workspace_change

sketchybar --add item yabai_dummy left \
  --set yabai_dummy display=0 \
  script="$PLUGIN_DIR/spaces.sh" \
  --subscribe yabai_dummy yabai_workspace_change

# Get display IDs
for m in $(yabai -m query --displays | jq -r '.[].id'); do
  # Get all space indices for display $m
  for sid in $(yabai -m query --spaces --display $m | jq -r '.[].index'); do
    sketchybar --add space space.$sid left \
      --set space.$sid space=$sid \
      icon=$sid \
      background.color=$TRANSPARENT \
      label.color=$ACCENT_COLOR \
      icon.color=$ACCENT_COLOR \
      display=$m \
      label.font="sketchybar-app-font:Regular:12.0" \
      icon.font="SF Pro:Semibold:12.0" \
      label.padding_right=10 \
      label.y_offset=-1 \
      click_script="$PLUGIN_DIR/space_click.sh $sid"

    # Get apps in space
    apps=$(yabai -m query --windows --space "$sid" | jq -r '.[].app' \
      | awk '!seen[$0]++' | sort)

    icon_strip=""
    if [ -n "$apps" ]; then
      while read -r app; do
        icon_strip+=" $($PLUGIN_DIR/icons.sh "$app")"
      done <<<"$apps"
    else
      icon_strip=" —"
    fi

    sketchybar --set space.$sid label="$icon_strip"
  done

  # Hide empty spaces
  for empty_space in $(yabai -m query --spaces --display $m | jq -r '.[] | select(.windows | length == 0) | .index'); do
    sketchybar --set space.$empty_space display=0
  done

  # Highlight focused space
  focused_space=$(yabai -m query --spaces --display $m | jq -r '.[] | select(.focused == 1) | .index')
  if [ -n "$focused_space" ]; then
    sketchybar --set space.$focused_space background.drawing=on \
      background.color=$ACCENT_COLOR \
      label.color=$ITEM_COLOR \
      icon.color=$ITEM_COLOR
  fi
done

