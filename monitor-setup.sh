#!/bin/bash

for output in $(xrandr | grep '\Wconnected' | awk {'print $1'}); do
  if [[ $output =~ ^HDMI-2$ ]]
  then
    xrandr --output HDMI-2 --mode 3440x1440 --primary --output eDP-1 --off
  else
    xrandr --output eDP-1 --mode 2048x1152 --primary
  fi
done

setxkbmap -option caps:escape
