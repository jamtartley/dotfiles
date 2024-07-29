#!/usr/bin/env zsh

alias c='clear'
alias cd-='cd -'
alias cf='cat $(fzf)'
alias cp='cp -iv'
alias dc='cd'
alias g='git'
alias ga='git add'
alias gac='git add . && git commit -m'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gl='git log'
alias glo='git log --oneline'
alias gpl='git pull'
alias gpsh='git push'
alias gr='git root'
alias gre2='git rebase -i HEAD~2'
alias gre='git rebase'
alias gsh='git show'
alias gst='git stash'
alias gw='git worktree'
alias k='kubectl'
alias l='ls -al --color=always'
alias mkd="mkdir -pv"
alias p='pnpm'
alias pf='pnpm --filter'
alias t="tmux attach || tmux"
alias tf="terraform"
alias tg="TERRAGRUNT_PROVIDER_CACHE=1 terragrunt"
alias tks="tmux kill-session"
alias v='nvim'
alias vf='vim $(fzf)'
