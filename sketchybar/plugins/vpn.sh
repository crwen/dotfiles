#!/bin/bash

# source "$HOME/.config/sketchybar/icons.sh"
# source "$HOME/.config/sketchybar/colors.sh"
source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

CURRENT_WIFI="$(ps -Aceo pid,comm -r | grep ClashX)"
# SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"
# CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"

if [ "$CURRENT_WIFI" = "" ]; then
  # sketchybar --set $NAME label="Disconnected" icon=$WIFI
  # sketchybar --set $NAME label="Disconnected" icon=$WIFI_SLASH
  sketchybar --set $NAME label="Disconnected" icon=$WIFI
else
  # sketchybar --set $NAME label="$SSID (${CURR_TX}Mbps)" icon=$WIFI
  sketchybar --set $NAME label="$CURRENT_WIFI" icon=$WIFI_SLASH
fi
