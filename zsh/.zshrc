export BROWSER=google-chrome-stable
export DEV=$HOME/dev
export DOTFILES=$DEV/.dotfiles
export EDITOR=nvim
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow -g '!{.git,node_modules}/*' 2> /dev/null"
export GEM_HOME=$HOME/.gem
export GITHUB=https://github.com/jamtartley
export JAVA_HOME=/usr/lib/jvm/default
export KEYTIMEOUT=25
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export VISUAL=nvim
export XDG_CONFIG_HOME=$HOME/.config
export ZSH=$HOME/.oh-my-zsh
export _JAVA_AWT_WM_NONREPARENTING=1

export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.scripts:$PATH
export PATH=$HOME/.dotnet/tools:$PATH
export PATH=$GEM_HOME/bin:$PATH

DISABLE_AUTO_UPDATE="false"
ZSH_THEME="cloud"

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

function git() {
  if [ $# -eq 0 ]; then
    command git status
  elif [ "$1" = root ]; then
    shift
    local ROOT
    if [ "$(command git rev-parse --is-inside-git-dir 2> /dev/null)" = true ]; then
      if [ "$(command git rev-parse --is-bare-repository)" = true ]; then
        ROOT="$(command git rev-parse --absolute-git-dir)"
      else
        # Note: This is a good-enough, rough heuristic, which ignores
        # the possibility that GIT_DIR might be outside of the worktree;
        # see:
        # https://stackoverflow.com/a/38852055/2103996
        ROOT="$(command git rev-parse --git-dir)/.."
      fi
    else
      # Git 2.13.0 and above:
      ROOT="$(command git rev-parse --show-superproject-working-tree 2> /dev/null)"
      if [ -z "$ROOT" ]; then
        ROOT="$(command git rev-parse --show-toplevel 2> /dev/null)"
      fi
    fi
    if [ -z "$ROOT" ]; then
      ROOT=.
    fi
    if [ $# -eq 0 ]; then
      cd "$ROOT"
    else
      (cd "$ROOT" && eval "$@")
    fi
  else
    command git "$@"
  fi
}

for file in $DOTFILES/*/*.zsh; do
    source "$file"
done

[[ -x ~/.zsh_aliases ]] && source ~/.zsh_aliases
