# Base16 Shell
BASE16_SHELL="/Users/callum/.config/base16-shell/scripts/base16-solarized-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

shopt -s extglob

# history
HISTIGNORE="&:ls:pwd:[fb]g:exit:clear:history"
HISTCONTROL="ignoredups"
HISTSIZE=20
HISTFILESIZE=999
HISTTIMEFORMAT="%R%t"

# ignore filetypes in tab completion
FIGNORE=".o:.sw[op]:~"

# LSCOLORS config
eval `dircolors $HOME/.dircolorsrc`

# personal aliases
alias view="vim -R"
alias gdb="gdb -q"
alias dirs="dirs -v"
alias ls="ls --color -F"
alias lr="ls --color -lagFqt \!* | head" # not working
alias batst="grep POWER_SUPPLY_CAPACITY /sys/class/power_supply/BAT0/uevent"

# bash functions
md(){
    pandoc -t plain "$1" | less;
} # display markdown text in terminal with formatting removed
