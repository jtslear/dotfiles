#!/bin/bash

for output in $(xrandr | grep '\Wconnected' | awk {'print $1'}); do
  if [[ $output =~ ^HDMI2$ ]]
  then
    xrandr --output HDMI2 --auto --set audio on
    xrandr --output HDMI2 --auto --set audio on --mode 3440x1440 --primary --output eDP1 --off
    sleep 2
    killall dunst
    notify-send 'monitor-setup'
  else
    xrandr --output eDP1 --mode 1600x900 --primary
    sleep 2
    killall dunst
    notify-send 'monitor-setup'
  fi
done

setxkbmap -option caps:escape
