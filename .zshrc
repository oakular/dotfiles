### Written by Oakular for use on my Arch Linux machine
### Some credit goes to inject3d (https://github.com/inject3d/dotfiles)

# powersave enabled by default
sudo pm-powersave true

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-shell/base16-flat.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# exports
export PANEL_FIFO=/tmp/panel-fifo
export PATH=$PATH:/
export EDITOR="vim"
export VISUAL="vim"
export STEAM_RUNTIME=0

# allows for use of powerlevel9k themes
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

# ----- SETTING UP VI MODE W/ VISUAL AIDS -----

# vim mode
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# function shows current vi mode (uncomment if not using powerlevel9k)
#function zle-line-init zle-keymap-select
#{
#    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#	RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
#    zle reset-prompt
#}

#zle -N zle-line-init						# enable above function
#zle -N zle-keymap-select

# reducing lag on keybind change
export KEYTIMEOUT=1

# ----- END OF SETTING UP VI MODE -----

setopt auto_cd 								# removes need to type 'cd'
setopt correct 								# enables spellchecking

# History
HISTFILE=~/.histfile
HISTSIZE=1000								# limits histfile size
SAVEHIST=1000								# limits histfile size
setopt HIST_IGNORE_DUPS						# forces history to ignore duplicates

# ----------------------------------
# POWERLEVEL9K CONFIGURATION
# -----------------------------------
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=false			# displays prompt on newline

# os_icon segment colors
POWERLEVEL9K_OS_ICON_FOREGROUND='black'
POWERLEVEL9K_OS_ICON_BACKGROUND='yellow'

# dir segment colors
POWERLEVEL9K_DIR_HOME_BACKGROUND='white'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='white'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='white'

# vcs segment colors
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'

# time segment colors
#POWERLEVEL9K_TIME_FOREGROUND='black'
#POWERLEVEL9K_TIME_BACKGROUND='red'

# status segment colors
POWERLEVEL9K_STATUS_VERBOSE=false
#POWERLEVEL9K_STATUS_ERROR_FOREGROUND='yellow' 		# only if verbose =
#POWERLEVEL9K_STATUS_ERROR_BACKGROUND='red'			# true

# vi mode colors
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='green'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='blue'

# PROMPT, COMMAND COMPLETION & COLORS
# -----------------------------------

autoload -Uz colors && colors				# enables colors in zsh

autoload -Uz compinit 						# enables command completion
compinit

zstyle :compinstall filename '/home/oakular/.zshrc'
zstyle ':completion:*' menu select 			# enables the command completion
setopt completealiases						# allows for completion of aliases

autoload -Uz promptinit 					# enables prompt themes
promptinit

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

#-------------------
# Personnal Aliases
#-------------------

alias lock="~/.lock.sh"

#alias redshift='redshift -l 35.22:-80.84'
#alias nightmode='redshift -r -O 3600 -b .5'

alias testpl='echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"'

alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'

# aliases to  make use of pacman less verbose
alias pac='sudo pacmatic -S'
alias pacsy='sudo pacmatic -Syy'
alias pacu='sudo pacmatic -Syu'
alias pacr='sudo pacmatic -Rns'
alias pacss='pacmatic -Ss'

# aliases for VPN connection
alias vpn-con="nmcli con up id"
alias vpn-dcon="nmcli con down id"

# fixing gpmdp so that is loads past login
alias gpmdp="gpmdp --disable-gpu"

# steam runtime fix
# alias steam="STEAM_RUNTIME=1 steam"

# prevents accidentally clobbering files.
alias mkdir='mkdir -p'

# pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------

alias ls='ls -oh --color'

#-------------------------------------------------------------
# dirs config
#-------------------------------------------------------------

alias dirs="dirs -v"

#-------------------------------------------------------------
# File & strings related functions:
#-------------------------------------------------------------

function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

ttyctl -f

function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
function parse_current_dir {
    ruby -e "puts ('../'+Dir.getwd.split('/').last(2).join('/')).gsub('//', '/')"
}

zstyle ':completion:*' menu select

setopt completealiases
