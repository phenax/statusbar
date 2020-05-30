source $ROOT/icon.sh;
source $ROOT/helpers.sh;

# Workspaces for bspwm
bspwm_module() {
  local selected_ws=$(bspc query -D -d --names);

  get_ws_list() {
    echo "$selected_ws";
    wmctrl -l | awk '{print $2 + 1}';
  }

  local wsp=$(get_ws_list | sort | uniq);

  echo -n $wsp | sed \
    -e "s/\s*$selected_ws\s*/%{F$COLOR_ACCENT}\0%{F$COLOR_FG}/g" \
  ;
}

date_module() {
  echo "$(icon date)$(date +"%l:%M %p")";
}

battery_module() {
  echo "$(icon battery)$(battery_component capacity)%";
}

music_module() {
  echo "$(icon music) $(playerctl metadata --format '{{title}} - {{artist}}')"
}

brightness_module() {
  echo "$(icon brightness) $(printf "%.0f%s" "$(xbacklight -get)" "%")"
}

volume_module() {
  echo "$(icon volume) $(volume_component 2)"
}
