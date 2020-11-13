export BROWSER=google-chrome-stable
export DEV=$HOME/dev
export DOTFILES=$DEV/.dotfiles
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!{node_modules,.git}"'
export GITHUB=https://github.com/jamtartley
export JAVA_HOME=/usr/lib/jvm/default
export KEYTIMEOUT=25
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export TERM=xterm-256color
export VISUAL=nvim
export XDG_CONFIG_HOME=$HOME/.config
export ZSH=$HOME/.oh-my-zsh

export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.scripts:$PATH
export PATH=$HOME/.dotnet/tools:$PATH

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

if [ "$ISLINUX" '==' 'true' ]; then
    { infocmp -1 xterm-256color ; echo "\tsitm=\\E[3m,\n\tritm=\\E[23m,"; } | \
        tic -x -
fi

# zplug
source $HOME/.zplug/init.zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "softmoth/zsh-vim-mode"
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "$HOME/.zsh", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

tldr() {
  curl "https://cheat.sh/$1"
}

for file in $DOTFILES/*/*.zsh; do
    source "$file"
done

[[ -x ~/.zsh_aliases ]] && source ~/.zsh_aliases

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
