#!/bin/bash

TARGET_INDEX=$1

# Get all normal (non-fullscreen) space indexes
spaces=$(yabai -m query --spaces | jq -r '.[] | select(.is-native-fullscreen==false) | .index')

# Check if target space exists
if echo "$spaces" | grep -qw "$TARGET_INDEX"; then
    # Space exists, just move & focus
    yabai -m window --space "$TARGET_INDEX"
    yabai -m space --focus "$TARGET_INDEX"
else
    # Space doesn't exist, create a new one and move
    # Use AppleScript to create a new desktop space
    osascript -e 'tell application "System Events" to key code 124 using control down' # Ctrl + Right Arrow to add space

    # Wait a moment for macOS to create space
    sleep 0.5

    # Now query spaces again, get the new highest space index
    new_index=$(yabai -m query --spaces | jq -r '.[] | select(.is-native-fullscreen==false) | .index' | sort -n | tail -1)

    # Move window and focus new space
    yabai -m window --space "$new_index"
    yabai -m space --focus "$new_index"
fi

