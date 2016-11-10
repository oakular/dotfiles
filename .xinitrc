[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
setxkbmap uk
setxkbmap -option caps:escape

/usr/bin/xinput set-button-map 1 9 3 4 5 6 7 8 9
exec i3

#Section "Device"
#    Identifier  "Intel Graphics"
#	Driver                               "intel"
#    Option      "AccelMethod"            "uxa"
#	Option      "TearFree"               "true"
#EndSection

settroot -cursor_name left_ptr
xset r rate 100 25
