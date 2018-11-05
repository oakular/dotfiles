# Base16 Shell
# BASE16_SHELL="/Users/callum/.config/base16-shell/scripts/base16-solarized-light.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

shopt -s extglob

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/usr/local/MacGPG2/bin:$HOME/.composer/vendor/bin/:$HOME/.bin/:/Applications/Xcode.app/Contents/Developer/usr/bin/:/usr/local/Caskroom/

# history
HISTIGNORE="&:ls:pwd:[fb]g:exit:clear:history"
HISTCONTROL="ignoredups"
HISTSIZE=20
HISTFILESIZE=999
HISTTIMEFORMAT="%R%t"

# ignore filetypes in tab completion
FIGNORE=".o:.sw[op]:~"

# personal aliases
alias view="vim -R"
alias gdb="gdb -q"
alias dirs="dirs -v"
alias ls="ls -GF"
alias lr="ls -lagGFqt \!* | head" # not working

# bash functions
md(){
    pandoc -t plain "$1" | less;
} # display markdown text in terminal with formatting removed

