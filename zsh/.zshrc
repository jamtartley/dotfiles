export DEV=$HOME/dev
export DOTFILES=$DEV/.dotfiles
export EDITOR=vim
export GITHUB=https://github.com/jamtartley
export ZSH=$HOME/.oh-my-zsh

DISABLE_AUTO_UPDATE="false"
ZSH_THEME="bira"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias c='clear'
alias cv='clear;vim'
alias v='vim'
alias l="ls -alhG"
alias mkd="mkdir -pv"

alias ag="ag --path-to-ignore ~/.ignore"

alias gs='git status'
alias gits='git status'
alias gitd='git diff'

alias dev="cd $DEV"
alias dots="cd $DOTFILES"

for file in $DOTFILES/*/*.zsh; do
    source "$file"
done
