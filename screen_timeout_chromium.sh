#!/bin/bash

# https://github.com/swaywm/sway/issues/4433#issue-477709822

if [[ $1 != "force" ]]; then
  chromium_focused=$(swaymsg -t get_tree | jq -r '.. | select(.window_properties?.class == "Chromium") | .focused' | grep "true" | wc -l)
  chromium_playing=$(pacmd list-sink-inputs | grep 'application.name = "Chromium"' | wc -l)
  echo "$chromium_focused $chromium_playing"
  if [[ $chromium_focused -gt 0 && $chromium_playing -gt 0 ]]; then
    echo "Inhibit idle while chromium is focused and playing"
    exit 1
  fi
  swaymsg "output * dpms off"
fi