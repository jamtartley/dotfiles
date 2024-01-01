function add_to_path_if_not_exists() {
  local new_path="$1"

  [[ ":$path:" != *":$new_path:"* ]] && path+=("$new_path")
}

typeset -U path PATH

add_to_path_if_not_exists "$HOME/.cargo/bin"
add_to_path_if_not_exists "$HOME/.local/bin"
add_to_path_if_not_exists "$HOME/.local/bin/scripts"
add_to_path_if_not_exists "$HOME/go/bin"
add_to_path_if_not_exists "/opt/android-sdk/platform-tools"
add_to_path_if_not_exists "/usr/local/Cellar"
add_to_path_if_not_exists "/usr/local/opt"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- vt1 &> /dev/null
