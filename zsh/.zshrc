export DOTFILES=$HOME/.dotfiles
export DEV=$HOME/dev
export EDITOR=vim
export GITHUB=https://github.com/jamtartley
export ZSH=$HOME/.oh-my-zsh
export PATH=/usr/local/lib:/.local/lib/python3.7/site-packages:/opt/piavpn/bin:$PATH

DISABLE_AUTO_UPDATE="false"
ZSH_THEME="bira"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias c='clear'
alias cv='clear;vim'
alias v='vim'
alias l="ls -alhG"
alias ls="ls -alhG"

alias ag="ag --path-to-ignore ~/.ignore"

alias gs='git status'
alias gits='git status'
alias gitd='git diff'

alias dev="cd $DEV"
alias dots="cd $DOTFILES"

for file in $DOTFILES/*/*.zsh; do
    source "$file"
done
