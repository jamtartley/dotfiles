export BROWSER=qutebrowser
export DEV=$HOME/dev
export DOTFILES=$DEV/.dotfiles
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden --color=never -g "*.{c,cs,git*,h,js,json,md,py,sh,sql,ts,txt,vim,zsh}"'
export GITHUB=https://github.com/jamtartley
export TERM=xterm-256color
export VISUAL=nvim
export XDG_CONFIG_HOME=$HOME/.config
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
alias l="ls -alhG"
alias mkd="mkdir -pv"
alias rz="source $HOME/.zshrc"

if type nvim > /dev/null 2>&1;
then
    alias v='nvim'
    alias vim="nvim"
fi

alias vf='vim $(fzf)'

alias gs='git status'

alias dev="cd $DEV"
alias dots="cd $DOTFILES"

for file in $DOTFILES/*/*.zsh; do
    source "$file"
done
