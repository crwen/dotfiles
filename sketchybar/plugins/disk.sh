
#!/bin/bash
# sketchybar -m --set disk_percentage label=$(df -lh | grep /dev/disk1s2 | awk '{print $5}')
sketchybar --set $NAME label="$(df -lh | grep /dev/disk1s2 | awk '{print $5}')"
# sketchybar --set $NAME label="$SSID (${CURR_TX}Mbps)" icon=$WIFI
