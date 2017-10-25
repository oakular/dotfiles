# Base16 Shell
BASE16_SHELL="/Users/callum/.config/base16-shell/scripts/base16-solarized-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# history
HISTIGNORE="&:ls:pwd:exit:clear:history"
HISTCONTROL="ignoredups"
HISTSIZE=20
HISTFILESIZE=999
HISTTIMEFORMAT="%R%t"

# personal aliases
alias view="vim -R"
alias gdb="gdb -q"
alias dirs="dirs -v"
alias ls="ls -F"

# bash functions
md(){
    pandoc -t plain "$1" | less;
} # display markdown text in terminal with formatting removed

