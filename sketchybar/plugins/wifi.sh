#!/usr/bin/env sh

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"
CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"

if [ "$SSID" = "" ]; then
  # sketchybar --set $NAME label="Disconnected" icon=$WIFI
  sketchybar --set $NAME label="Disconnected" icon=$WIFI_SLASH
else
  # sketchybar --set $NAME label="$SSID (${CURR_TX}Mbps)" icon=$WIFI
  sketchybar --set $NAME icon=$WIFI
fi
