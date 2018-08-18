#!/bin/bash

# laptop monitor
xrandr --output LVDS1 --mode 1366x768 --rate 60

xrandr --output HDMI2 --mode 1360x768 --rate 59.80 --brightness 0.30

xrandr --output LVDS1 --left-of HDMI2
xrandr --output LVDS1 --primary
