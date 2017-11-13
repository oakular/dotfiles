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

date

# tty cursor setup
# printf '\e[?8c' # make cursor a block
# printf '\033[?17;0;127c' # remove cursor blinking

source "$HOME/.bashrc"
