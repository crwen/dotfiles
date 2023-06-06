
#!/bin/bash

# vpn=(
#   icon=$AIR
#   # icon.font="$FONT:Black:12.0"
#   # icon.padding_right=0
#   # label.width=45
#   # label.align=right
#   # padding_left=15
#   # update_freq=30
#   script="$PLUGIN_DIR/vpn.sh"
#   # click_script="$PLUGIN_DIR/zen.sh"
# )

# sketchybar --add item vpn right                         \
#            --set vpn "${vpn[@]}" \
           # --subscribe wifi system_woke
           # --set wifi    script="$PLUGIN_DIR/wifi.sh"    \
           #               background.padding_right=12     \
           #               update_freq=5

sketchybar --add item wifi right                               \
           --set wifi    script="$PLUGIN_DIR/wifi.sh"          \
                         icon=直                               \
           --subscribe wifi wifi_change                        \
