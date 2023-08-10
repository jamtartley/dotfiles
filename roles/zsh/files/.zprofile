function prepend() {
	local LOCATION=$1
	PATH=${PATH//":$LOCATION:"/:} # Delete (potentially multiple) from middle.
	PATH=${PATH/#"$LOCATION:"/} # Delete from start.
	PATH=${PATH/%":$LOCATION"/} # Delete from end.
	PATH="$LOCATION${PATH:+:$PATH}" # Actually prepend (or if PATH is empty, just set).
}

function append() {
	local LOCATION=$1
	PATH=${PATH//":$LOCATION:"/:} # Delete (potentially multiple) from middle.
	PATH=${PATH/#"$LOCATION:"/} # Delete from start.
	PATH=${PATH/%":$LOCATION"/} # Delete from end.
	PATH="${PATH:+$PATH:}$LOCATION" # Actually append (or if PATH is empty, just set).
}

append $HOME/.cargo/bin:$PATH
append $HOME/.local/bin:$PATH
append /opt/android-sdk/platform-tools:$PATH
append /usr/local/Cellar:$PATH

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx -- vt1 &> /dev/null
