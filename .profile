if [ -x /usr/libexec/path_helper ]; then
	eval "`/usr/libexec/path_helper -s`"
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

# exports
export TERM='xterm-256color'
export EDITOR="vim"
export HOMEBREW_GITHUB_API_TOKEN="465878db9a3ce7ef75a20f63ffb9c8752d16ffc1"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

date

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

source "$HOME/.bashrc"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

