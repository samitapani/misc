#
# ~/.bashrc
#

[[ $- != *i* ]] && return

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;; esac

use_color=true

xhost +local:root > /dev/null 2>&1

[[ $DISPLAY ]] && shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

# alias
alias rr=reset && clear
alias vi=vim
alias vi='vim -p'
alias vim='vim -p'
alias l='ls --color=auto'
alias ls='ls --color=auto'
alias ll='ls --color=auto -hlrt' # sort ts
alias la='ls --color=auto -Ahlrt' # sort ts

alias lS='ls --color=auto -hlrS' # sort size

alias l.='ls -ld  --group-directories-first .[^.]*'

alias pss='ps -eo euser,ruser,suser,fuser,f,comm,label'
alias pst='pstree -alpU'

alias rr="reset && clear"

#alias cp='cp -i' # failsafe for stupid people
#alias mv='mv -i' # failsafe for stupid people
alias rm='rm -i' # failsafe for stupid people, this doesn't help, idiots start to press y automatically

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export PAGER=/usr/bin/less
export BROWSER=/usr/bin/google-chrome-stable

alias ei3="$EDITOR $HOME/.i3/config"
alias ebr="$EDITOR $HOME/.bashrc"
alias evrc="$EDITOR $HOME/.vimrc"

# move these
xset -b
setxkbmap fi -option caps:swapescape -variant nodeadkeys

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

