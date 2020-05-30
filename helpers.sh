
statusbar() {
  local truebg=$(echo $COLOR_BG | sed "s/^#/#$ALPHA/");

  lemonbar $([[ "$POSITION" == "bottom" ]] && echo "-b") \
    -o 0 \
    -f 'Fira Code:size=9' \
    -o -2 \
    -f 'Font Awesome 5 Free:size=7' \
    -o -3 \
    -f 'Symbols Nerd Font:size=7' \
    -F "$COLOR_FG" \
    -B "$truebg" \
    -n 'monkeybar' \
  ;
}

sep() { echo "%{F#666}$SEPERATOR%{F$COLOR_FG}"; }

volume_component() { amixer get Master | awk -F'[][]' '/dB/ {print $C}' C="$1"; }

battery_component() { echo -e "$(cat "/sys/class/power_supply/BAT0/$1")"; }
