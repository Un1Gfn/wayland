#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo -e "\n  $(basename "$0") <default seconds>\n" 
  exit 1
fi

# https://linux.byexamples.com/archives/259/a-complete-zenity-dialog-examples-1/
# https://linux.byexamples.com/archives/265/a-complete-zenity-dialog-examples-2/
# zenity \
#   --list \
#   --text='text' \
#   --column='A' --column='B'\
#   --radiolist \
#   FALSE 'C' \
#   FALSE 'D' \
#   FALSE 'E' \
#   FALSE 'F'

# https://stackoverflow.com/a/24902830
# PID="$(pgrep -f $(basename $0) | grep -v $$)"

SELF=$$
# https://unix.stackexchange.com/questions/117227
ALL="$(pidof -x -S $'\n' screen_timeout_set.sh)"
OTHERS="$(echo "$ALL" | grep -v -e "$SELF")"

# if [[ -n "$OTHERS" ]]; then
#   kill -SIGINT $OTHERS
#   pkill -x zenity
# fi

time=$(
  env --unset=DISPLAY zenity \
    --entry \
    --window-icon=question \
    --title='Screen Timeout' \
    --text='Enter the new screen timeout:' \
    --entry-text="$1"
)

R=$?
if [ "$R" -eq 0 ]; then
  if [ "$time" -gt 0 ]; then
    pkill swayidle &>/dev/null
    swayidle -w \
      timeout "$time" screen_timeout_chromium.sh \
      resume 'swaymsg "output * dpms on"' \
       &>/dev/null &
  fi
fi
