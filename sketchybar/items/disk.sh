
#!/bin/bash

disk_top=(
  label.font="$FONT:Semibold:7"
  label=DISK
  icon.drawing=off
  icon.drawing=on
  width=0
  padding_right=15
  y_offset=6
)

# brew=(
#   icon=􀐛
#   label=?
#   padding_right=10
# )
disk_percent=(
  label.font="$FONT:Heavy:12"
  # label=?
  y_offset=-4
  padding_right=15
  width=55
  icon.drawing=off
  script="$PLUGIN_DIR/disk.sh"
  update_freq=4
  mach_helper="$HELPER"
)

disk_sys=(
  width=0
  graph.color=$RED
  graph.fill_color=$RED
  label.drawing=off
  icon.drawing=off
  background.height=30
  background.drawing=on
  background.color=$TRANSPARENT
)

disk_user=(
  graph.color=$BLUE
  label.drawing=off
  icon.drawing=off
  background.height=30
  background.drawing=on
  background.color=$TRANSPARENT
)

sketchybar --add item disk.top right              \
           --set disk.top "${disk_top[@]}"         \
                                                 \
           --add item disk.percent right          \
           --set disk.percent "${disk_percent[@]}" \
                                                 \
           --add graph disk.sys right 75          \
           --set disk.sys "${disk_sys[@]}"         \
                                                 \
           --add graph disk.user right 75         \
           --set disk.user "${disk_user[@]}"

#            sketchybar -m --add item disk_label right \
#               --set disk_label label.font="FuraCode Nerd Font:Regular:10.0" \
#                                label=DISK \
#                                y_offset=6 \
#                                width=0 \
# \
#               --add item disk_percentage right \
#               --set disk_percentage label.font="FuraCode Nerd Font:Regular:10.0" \
#                                     y_offset=-4 \
#                                     update_freq=1 \
#                                     script="$PLUGIN_DIR/disk.sh"
