#!/bin/bash

WARN_THRESHOLD=9
# WARN_THRESHOLD=20
ACTION_THRESHOLD=7

sleep 7
while true; do
    read -r status capacity <<< "$(acpi -b | awk -F'[,:%]' '{print $2, $3}')"

    if [ "$status" == "Discharging" ] && [ "$capacity" -le $ACTION_THRESHOLD ]; then
      # systemctl hybrid-sleep
      systemctl hibernate

    # elif [ "$status" == "Discharging" ] && [ "$capacity" -le $WARN_THRESHOLD ] && ! pgrep i3-nagbar &>/dev/null; then
    #   # Warning.GUI
    #   ( sudo -u darren DISPLAY=:0.0 /usr/bin/i3-nagbar \
    #     --type warning \
    #     --font "pango:DejaVu Sans Mono 7" \
    #     --message "BAT<$WARN_THRESHOLD%, ACT<$ACTION_THRESHOLD%!" \
    #   &>/dev/null & )
    #   # Warining.VT
    #   openvt -fc 7 -- echo -e "\\033[2J\\033[0;0H"
    #   openvt -fc 7 -- echo -n "BAT<$WARN_THRESHOLD%, ACT<$ACTION_THRESHOLD%!" 
    #   ( chvt 7 &>/dev/null & )

    elif [ "$status" == "Discharging" ] && [ "$capacity" -le $WARN_THRESHOLD ] && ! pgrep zenity &>/dev/null; then
      # Warning.GUI
      # Create a pid file?
      # ( sudo -u darren DISPLAY=:0.0 /usr/bin/xmessage -fg white -bg blue -center "LOW BATTERY" &>/dev/null & )
      # https://unix.stackexchange.com/questions/422040/will-wayland-ever-support-graphical-sudo
      ( sudo -u darren XDG_RUNTIME_DIR="/run/user/$(id -u darren)" WAYLAND_DISPLAY=wayland-0 /usr/bin/zenity --warning --text="LOW BATTERY"  &>/dev/null & )
      # Warining.VT
      # for i in {2..6}; do
      #   # openvt -fc $i -- echo -e "\\033[2J\\033[0;0H"
      #   openvt -fc $i -- echo -n "BAT<$WARN_THRESHOLD%, ACT<$ACTION_THRESHOLD%!" 
      # done
    fi

    # elif [ "$status" == "Full" ] && ! pgrep i3-nagbar &>/dev/null; then
    #   ( sudo -u darren DISPLAY=:0.0 /usr/bin/i3-nagbar \
    #     --type warning \
    #     --font "pango:DejaVu Sans Mono 7" \
    #     --message "Battery fully charged" \
    #   &>/dev/null & )

    # else
    #   killall i3-nagbar

    sleep 10
done
