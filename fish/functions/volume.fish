function volume
if test -n "$argv[1]"
pactl set-sink-volume @DEFAULT_SINK@ $argv[1]
else
pactl get-sink-volume @DEFAULT_SINK@
end
end
