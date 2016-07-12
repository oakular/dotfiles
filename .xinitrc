[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
setxkbmap uk
setxkbmap -option caps:escape

exec tdm --xstart

Section "Device"
    Identifier "AMDGPU"
	Driver "amdgpu"
	Option "DRI" "3"
	Option "DRI3" "on"
	Option "TearFree" "on"
EndSection

settroot -cursor_name left_ptr
xset r rate 300 60
