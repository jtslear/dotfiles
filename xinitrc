dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

~/.monitor-setup.sh
xset +fp /home/skarbek/.local/share/fonts
xset fp rehash

feh --bg-fill ~/Downloads/04148_wingsofangelsnorthernlightsoniceland_3440x1440.jpg

exec i3
