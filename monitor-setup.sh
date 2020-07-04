#!/bin/bash

for output in $(xrandr | grep '\Wconnected' | awk {'print $1'}); do
  if [[ $output =~ ^HDMI2$ ]]
  then
    xrandr --output HDMI2 --auto --set audio on
    xrandr --output HDMI2 --auto --set audio on --mode 3440x1440 --primary --output eDP1 --off
  else
    xrandr --output eDP1 --mode 1600x900 --primary
  fi
done

setxkbmap -option caps:escape

echo cmd:restart > /tmp/polybar_mqueue.$(pidof polybar)
