#!/usr/bin/env bash

export ROOT=$HOME/scripts/statusbar;
source $ROOT/config.sh;
source $ROOT/helpers.sh;

reset_bar() {
  killall -9 lemonbar;

  bspc config top_padding 0;
  bspc config bottom_padding 0;
}

wait_for_next_signal() {
  sleep 1;
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
