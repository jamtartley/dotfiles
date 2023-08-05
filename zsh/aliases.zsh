#!/usr/bin/env zsh

alias c='clear'
alias mkd="mkdir -pv"
alias rz="source $HOME/.zshrc"

alias l='exa -al --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | grep -E "^\."'

if type nvim > /dev/null 2>&1;
then
	alias v='nvim'
	alias vim="nvim"
fi

alias cf='cat $(fzf)'
alias vf='vim $(fzf)'

alias g='git'
alias ga='git add'
alias gagc='git add . && git commit -m'
alias gb='git branch -a'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gs='git status'
alias gsh='git show'
alias gl='git log'
alias gr='git root'
alias gtag='git show-ref --abbrev=7 --tags'
alias gmsg='git log --format=%B -n 1 '

alias p='pnpm'

alias tmux='tmux -2'
alias tx='tmuxinator'
alias txe='tmuxinator edit'
alias txn='tmuxinator new'
alias txs='tmuxinator start'

alias k='kubectl'

alias dev="cd $DEV"
alias dots="cd $DOTFILES"
alias zshrc="vim $DOTFILES/zsh/.zshrc"

alias open="xdg-open"

alias ytmpj="youtube-dl --extract-audio --audio-format mp3 "
alias yt="youtube-dl -f bestvideo+bestaudio "

alias psmem="ps auxf | sort -nr -k 4 | head -5"
alias pscpu="ps auxf | sort -nr -k 3 | head -5"

alias xmerge="xrdb -merge ~/.Xresources"

alias tf="terraform"
alias tg="terragrunt"

alias dots="cd "$DOTFILES""
