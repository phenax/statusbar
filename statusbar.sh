#!/usr/bin/env bash

export ROOT=$HOME/scripts/statusbar;
export MODULE_CACHE_FILE="$HOME/.cache/status-monkeybar";
[[ ! -d "$MODULE_CACHE_FILE" ]] && mkdir -p $MODULE_CACHE_FILE;
rm $MODULE_CACHE_FILE/*;

source $ROOT/config.sh;
source $ROOT/helpers.sh;

reset_bar() {
  killall -9 lemonbar;

  bspc config top_padding 0;
  bspc config bottom_padding 0;
}


update=0;

SELF_PID=$$;

echo $SELF_PID;

on_signal() {
  update=$((update + 1));
  rm "$MODULE_CACHE_FILE/$1";
}

module_listener() {
  trap "on_signal $1" $2;
}

module_listener 'music' 2;

wait_for_next_signal() {
  sleep 0.1;
}

start_bar() {
  while true; do
    echo "%{I} $(get_left_bar) %{c}$(get_center_bar) %{r}$(get_right_bar) ";
    wait_for_next_signal;
  done | statusbar
}

case "$1" in
  show)
    reset_bar 2> /dev/null;
    start_bar 2> /dev/null;
  ;;
  hide) reset_bar 2> /dev/null; ;;
  *) echo "Usage: statusbar.sh (show|hide)" ;;
esac
