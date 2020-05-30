source $ROOT/modules.sh;
source $ROOT/helpers.sh;

NAME=monkeybar;
POSITION=top;

COLOR_FG="#ffffff";
COLOR_BG="#0f1215";
COLOR_ACCENT="#5180e9"
ALPHA="dd";

SEPERATOR=" :: ";

get_left_bar() {
  echo "$(module bspwm)";
}

get_center_bar() {
  echo "$(module music)";
}

get_right_bar() {
  echo "$(module volume)$(sep)$(module brightness)$(sep)$(module date)$(sep)$(module battery)";
}
