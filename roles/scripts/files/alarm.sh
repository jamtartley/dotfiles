#!/usr/bin/env bash

set -euo pipefail

if [[ $# -eq 0 ]]; then
    if ! command -v rofi >/dev/null 2>&1; then
        echo "Error: rofi is not installed or not in PATH." >&2
        exit 1
    fi

    minutes=$(rofi -dmenu -p "Alarm minutes: ") || exit 0
elif [[ $# -eq 1 || $# -eq 2 ]]; then
    minutes=$1
else
    echo "Usage: $0 [MINUTES [MESSAGE]]" >&2
    exit 1
fi

if [[ ! $minutes =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: minutes must be a positive integer." >&2
    exit 1
fi

if ! command -v notify-send >/dev/null 2>&1; then
    echo "Error: notify-send is not installed or not in PATH." >&2
    exit 1
fi

runtime_dir=${XDG_RUNTIME_DIR:-"$HOME/.cache"}
mkdir -p "$runtime_dir"
pidfile="$runtime_dir/alarm.pid"

if [[ -f "$pidfile" ]]; then
    old_pid=$(<"$pidfile")
    if [[ $old_pid =~ ^[1-9][0-9]*$ ]] && kill -0 "$old_pid" 2>/dev/null; then
        kill "$old_pid" 2>/dev/null || true
        for _ in {1..10}; do
            kill -0 "$old_pid" 2>/dev/null || break
            sleep 0.1
        done
    fi
fi

printf '%s\n' "$$" >"$pidfile"
cleanup() {
    if [[ -f "$pidfile" ]] && [[ $(<"$pidfile") == "$$" ]]; then
        rm -f "$pidfile"
    fi
}
trap cleanup EXIT INT TERM

message=${2:-"$minutes minute alarm finished."}

alarm_time=$(date --date="+${minutes} minutes" '+%H:%M')
notify-send "Alarm set" "Alarm will ring at ${alarm_time} (${minutes} minutes)"

sleep "${minutes}m"
notify-send --urgency=critical "Alarm" "$message"
