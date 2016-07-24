[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
setxkbmap uk
setxkbmap -option caps:escape

exec tdm --xstart

Section "Device"
    Identifier  "Intel Graphics"
	Driver                               "intel"
    Option      "AccelMethod"            "uxa"
	Option      "TearFree"               "true"
EndSection

settroot -cursor_name left_ptr
xset r rate 300 60
