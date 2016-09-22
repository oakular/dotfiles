[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
setxkbmap uk
setxkbmap -option caps:escape

exec i3

Section "Device"
    Identifier  "Intel Graphics"
	Driver                               "intel"
    Option      "AccelMethod"            "uxa"
	Option      "TearFree"               "true"
EndSection

settroot -cursor_name left_ptr
xset r rate 100 25
