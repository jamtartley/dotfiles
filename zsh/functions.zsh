#!/usr/bin/env zsh

function tldr() {
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

function in() {
    yay -Slq | fzf -q "$1" -m --preview 'yay -Si {1}'| xargs -ro yay -S
}
