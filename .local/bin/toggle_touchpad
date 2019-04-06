#!/bin/bash
if synclient | grep --quiet 'TouchpadOff             = 0'; then
  synclient TouchpadOff=1
  notify-send -t 1 Touchpad Disabled
else
  synclient TouchpadOff=0
  notify-send -t 1 Touchpad Enabled
fi
