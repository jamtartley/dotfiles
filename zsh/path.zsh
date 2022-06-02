#!/usr/bin/env zsh

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

append $HOME/bin:$PATH
append $HOME/.scripts:$PATH
append $HOME/.dotnet/tools:$PATH
