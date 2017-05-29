### Written by Oakular for use on my Arch Linux machine
#n## Some credit goes to inject3d (https://github.com/inject3d/dotfiles)
#
source ~/.zprofile

# make cursor white for gnome-terminal compatablility with vim
echo -e "\e]12;white\a"

# run 256 colors
export TERM="xterm-256color"

# Base16 Shell
BASE16_SHELL="/home/oakular/.config/base16-shell/scripts/base16-atelier-lakeside.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# exports
export PANEL_FIFO=/tmp/panel-fifo
export PATH=$PATH:"$HOME/.local/bin/":/
export EDITOR="vim"
export VISUAL="vim"
export STEAM_RUNTIME=1

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
function zle-line-init zle-keymap-select
{
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init                       # enable above function
zle -N zle-keymap-select

# reducing lag on keybind change
export KEYTIMEOUT=1

# ----- END OF SETTING UP VI MODE -----

# enable reverse tab completion
bindkey '^[[Z' reverse-menu-complete

setopt auto_cd                              # removes need to type 'cd'
setopt correct                              # enables spellchecking

# History
HISTFILE=~/.histfile
HISTSIZE=1000                               # limits histfile size
SAVEHIST=1000                               # limits histfile size
setopt HIST_IGNORE_DUPS                     # forces history to ignore duplicates

# PROMPT, COMMAND COMPLETION & COLORS
# -----------------------------------

autoload -Uz colors && colors               # enables colors in zsh

autoload -Uz compinit                       # enables command completion
compinit

zstyle :compinstall filename '/home/oakular/.zshrc'
zstyle ':completion:*' menu select          # enables the command completion
setopt completealiases                      # allows for completion of aliases

# pure prompt config
autoload -Uz promptinit                     # enables prompt themes
promptinit
prompt pure

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

#-------------------
# Personal Aliases
#-------------------

# use vim for view mode
alias view="vim -R"

# shorter aiksaurus command
alias aik="aiksaurus"

alias firefox="GTK_THEME=Adwaita:dark firefox &"

# launch gdb in quiet mode
alias gdb="gdb -q"

# rotate monitor
alias rotatel="xrandr -o left"
alias rotaten="xrandr -o normal"

# stone of life
alias lf="cat ~/personal/mission"
alias val="cat ~/personal/values"
alias tol="cat ~/personal/truths"

#alias redshift='redshift -l 35.22:-80.84'
#alias nightmode='redshift -r -O 3600 -b .5'

alias testpl='echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"'

alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'

# aliases to  make use of pacman less verbose
alias pac='sudo pacmatic -S'
alias pacsy='sudo pacmatic -Syy && echo "\n----- PACKAGES TO UPDATE -----" && pacmatic -Qu && echo "\n----- AUR PACKAGES -----" && cower -u'
alias pacu='sudo pacmatic -Syu'
alias pacr='sudo pacmatic -Rns'
alias pacss='pacmatic -Ss'

# alias for pass so that all passwords are automatically copied to the clipboard
alias passcp='pass show -c'

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

# start gnome with wayland
alias gnome-sess-wayland='gnome-session --session gnome-wayland'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------

alias ls='ls -oh --color --group-directories-first'

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

# --- func to display markdown text in terminal with formattin removed
md(){
    pandoc -t plain "$1" | less;
}
