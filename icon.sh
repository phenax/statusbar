source $ROOT/helpers.sh;

playerctl_icon() {
  local playstate="$(playerctl status)";
  case "$playstate" in
    Paused) echo "" ;;
    Playing) echo "" ;;
    Stopped) echo "" ;;
    *) ;;
  esac
}

volume_icon() {
  volume_component 6 | sed 's/on//; s/off//';
}

icon() {
  case "$1" in
    date)        echo "" ;;
    battery)     echo " " ;;
    music)       playerctl_icon ;;
    volume)      volume_icon ;;
    brightness)  echo "" ;;
    *) ;;
  esac
}
