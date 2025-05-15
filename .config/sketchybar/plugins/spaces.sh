#!/bin/sh

source "$CONFIG_DIR/colors.sh"

update_workspace_appearance() {
  local sid=$1
  local is_focused=$2

  if [ "$is_focused" = "true" ]; then
    sketchybar --set space.$sid background.drawing=on \
      background.color=$ACCENT_COLOR \
      label.color=$ITEM_COLOR \
      icon.color=$ITEM_COLOR
  else
    sketchybar --set space.$sid background.drawing=off \
      label.color=$ACCENT_COLOR \
      icon.color=$ACCENT_COLOR
  fi
}

update_icons() {
  local sid=$1

  apps=$(yabai -m query --windows --space "$sid" | jq -r '.[].app' \
         | awk '!seen[$0]++' | sort)

  icon_strip=""
  if [ -n "$apps" ]; then
    while read -r app; do
      icon_strip+=" $($CONFIG_DIR/plugins/icons.sh "$app")"
    done <<< "$apps"
  else 
    icon_strip=" —"
  fi

  sketchybar --animate sin 10 --set space.$sid label="$icon_strip"
}

update_workspace_appearance "$PREV_WORKSPACE" "false"
update_workspace_appearance "$FOCUSED_WORKSPACE" "true"

# Get list of display IDs
displays=$(yabai -m query --displays | jq -r '.[].id')

for m in $displays; do
  # For each visible space on display $m
  space_ids=$(yabai -m query --spaces --display "$m" | jq -r '.[] | select(.visible == 1) | .index')

  for sid in $space_ids; do
    sketchybar --set space.$sid display=$m

    update_icons "$sid"
    update_icons "$PREV_WORKSPACE"

    # Count number of windows in space
    app_count=$(yabai -m query --windows --space "$sid" | jq 'length')

    if [ "$app_count" -eq 0 ]; then
      sketchybar --set space.$sid display=0
    fi
  done
done

