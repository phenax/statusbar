source $ROOT/helpers.sh;
source $ROOT/modules.sh;

NAME=monkeybar;
POSITION=top;

COLOR_FG="#ffffff";
COLOR_BG="#0f1215";
COLOR_ACCENT="#5180e9"
ALPHA="dd";

SEPERATOR=" :: ";

get_left_bar() {
  echo "$(bspwm_module)";
}

get_center_bar() {
  echo "$(music_module)";
}

get_right_bar() {
  echo "$(volume_module)$(sep)$(brightness_module)$(sep)$(date_module)$(sep)$(battery_module)";
}
