export BROWSER=qutebrowser
export DEV=$HOME/dev
export DOTFILES=$DEV/.dotfiles
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden --color=never -g ".*" -g "*.{c,cs,css,git*,h,html,js,json,less,md,pdf,py,sh,sql,tex,ts,tsx,txt,vim,zsh}"'
export GITHUB=https://github.com/jamtartley
export TERM=xterm-256color
export VISUAL=nvim
export XDG_CONFIG_HOME=$HOME/.config
export ZSH=$HOME/.oh-my-zsh

DISABLE_AUTO_UPDATE="false"
ZSH_THEME="bureau"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

source $ZSH/oh-my-zsh.sh

# zplug
source $HOME/.zplug/init.zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "$HOME/.zsh", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

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

alias dev="cd $DEV"
alias dots="cd $DOTFILES"

for file in $DOTFILES/*/*.zsh; do
    source "$file"
done
