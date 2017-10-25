if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

# exports
export TERM='xterm-256color'
export EDITOR="vim"
export VISUAL="vim"

# history
HISTIGNORE="&:ls:pwd:exit:clear:history"
HISTCONTROL="ignoredups"
HISTSIZE=20
HISTFILESIZE=999
HISTTIMEFORMAT="%R%t"

# Base16 Shell
BASE16_SHELL="/Users/callum/.config/base16-shell/scripts/base16-solarized-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


# personal aliases
alias view="vim -R"
alias gdb="gdb -q"
alias dirs="dirs -v"
alias ls="ls -F"

# bash functions
md(){
    pandoc -t plain "$1" | less;
} # display markdown text in terminal with formatting removed

