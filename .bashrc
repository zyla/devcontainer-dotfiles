# ~/.bashrc: executed by bash(1) for non-login shells.

if [ -z "$LESS" ]; then
	export LESS="-S -R"
fi

export LANG=C.UTF-8 LC_ALL=C.UTF-8

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

set -o vi

HISTSIZE=100000
HISTFILESIZE=1000000 
if [ $colorterm = yes ]; then
  PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='\h:\w$ '
fi

maybe_source() {
	[ -f "$1" ] && source "$1"
}

maybe_source ~/.dotfiles/git-completion.bash
maybe_source /usr/share/bash-completion/completions/tig

alias vim=nvim
alias S='tig status'
export PAGER=less
export EDITOR=vim

alias :e=nvim
