#!/usr/bin/env zsh

if type nvim > /dev/null 2>&1;
then
	alias v='nvim'
	alias vim="nvim"
fi

alias c='clear'
alias cf='cat $(fzf)'
alias dc='cd'
alias f='fzf | tr -d "\n" | xclip -sel clip'
alias g='git'
alias ga='git add'
alias gac='git add . && git commit -m'
alias gb='git branch -a'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias gr='git root'
alias gsh='git show'
alias k='kubectl'
alias l='exa -al --color=always --group-directories-first'
alias mkd="mkdir -pv"
alias open="xdg-open"
alias p='pnpm'
alias tf="terraform"
alias tg="terragrunt"
alias tmux='tmux -2'
alias vf='vim $(fzf)'
