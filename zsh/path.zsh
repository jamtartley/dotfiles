#!/usr/bin/env zsh

function prepend() {
	local LOCATION=$2
	PATH=${PATH//":$LOCATION:"/:} # Delete (potentially multiple) from middle.
	PATH=${PATH/#"$LOCATION:"/} # Delete from start.
	PATH=${PATH/%":$LOCATION"/} # Delete from end.
	PATH="$LOCATION${PATH:+:$PATH}" # Actually prepend (or if PATH is empty, just set).
}

function append() {
	local LOCATION=$2
	PATH=${PATH//":$LOCATION:"/:} # Delete (potentially multiple) from middle.
	PATH=${PATH/#"$LOCATION:"/} # Delete from start.
	PATH=${PATH/%":$LOCATION"/} # Delete from end.
	PATH="${PATH:+$PATH:}$LOCATION" # Actually append (or if PATH is empty, just set).
}

prepend $HOME/.gem/ruby/2.7.0/bin:$PATH
prepend $HOME/bin:$PATH
prepend $HOME/.scripts:$PATH
prepend $HOME/.dotnet/tools:$PATH
prepend $GEM_HOME/bin:$PATH
