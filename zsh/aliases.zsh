#!/usr/bin/env bash

alias c='clear'
alias l="ls -alhG"
alias mkd="mkdir -pv"
alias rz="source $HOME/.zshrc"

if type nvim > /dev/null 2>&1;
then
    alias v='nvim'
    alias vim="nvim"
fi

alias cf='cat $(fzf)'
alias vf='vim $(fzf)'

alias g='git status'
alias gs='git status -s'
alias gl='git log'
alias gtag='git show-ref --abbrev=7 --tags'

alias dev="cd $DEV"
alias dots="cd $DOTFILES"
alias zshrc="vim $DOTFILES/zsh/.zshrc"

alias open="xdg-open"

alias ytmp3="youtube-dl --extract-audio --audio-format mp3 "
alias ytmp4="youtube-dl "

alias psmem="ps auxf | sort -nr -k 4 | head -5"
alias pscpu="ps auxf | sort -nr -k 3 | head -5"

alias xmerge="xrdb -merge ~/.Xresources"
