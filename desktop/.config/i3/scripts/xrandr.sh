#!/bin/sh
xrandr --auto --output DP-1 --mode 2560x1440 --rate 165 --left-of HDMI-1
xrandr --auto --output HDMI-1 --mode 2560x1440 --rate 165 --right-of DP-1
