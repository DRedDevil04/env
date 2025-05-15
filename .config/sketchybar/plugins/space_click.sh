#!/bin/sh

space_id="$1"

# Get the space index of the currently focused space
focused=$(yabai -m query --spaces | jq -r '.[] | select(.focused == 1) | .index')

# Get the list of apps in the given space
apps=$(yabai -m query --windows --space "$space_id" | jq -r '.[].app')

if [ -z "$apps" ] && [ "$focused" != "$space_id" ]; then
  sketchybar --set space."$space_id" display=0
else
  yabai -m space --focus "$space_id"
fi

