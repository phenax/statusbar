#!/usr/bin/env bash

export ROOT=$HOME/scripts/statusbar;
source $ROOT/config.sh;
source $ROOT/helpers.sh;

# Commands {{{
reset_bar() {
  killall -9 lemonbar;

  bspc config top_padding 0;
  bspc config bottom_padding 0;
}

start_bar() {
  while true; do
    echo "%{I} $(get_left_bar) %{c}$(get_center_bar) %{r}$(get_right_bar) ";
    sleep 0.5;
  done | statusbar
}

case "$1" in
  show)
    reset_bar;
    start_bar
  ;;
  hide) reset_bar; ;;
  *) echo "Usage: statusbar.sh (show|hide)" ;;
esac
# }}}
