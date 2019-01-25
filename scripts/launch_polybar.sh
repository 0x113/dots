#sleep 1
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m /usr/bin/polybar --reload second &
  done
else
  /usr/bin/polybar --reload second &
fi
