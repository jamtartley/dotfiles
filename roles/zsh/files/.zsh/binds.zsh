#!/usr/bin/env zsh

bindkey -e

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^X" edit-command-line
