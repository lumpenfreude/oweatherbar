#!/bin/bash
read a b c <<< $(tr '\n' ' ' <$HOME/.config/polybar/wbar.conf)
read d e <<< $(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$a&appid=$b&units=$c" | jq -r '.main.temp, .weather[].icon' | tr '\n' ' ' | sed "s/\"//g")
t=$(printf %0.f $d)
i=""
if [[ $e == 01d ]]; then
    i=""
elif [[ $e == 01n ]]; then
    i=""
elif [[ $e == 02d ]]; then
    i=""
elif [[ $e == 02n ]]; then
    i=""
elif [[ $e == 03* || $e == 04*  ]]; then
    i=""
elif [[ $e == 09* ]]; then
    i=""
elif [[ $e == 10d ]]; then
    i=""
elif [[ $e == 10n ]]; then
    i=""
elif [[ $e == 11* ]]; then
    i=""
elif [[ $e == 13* ]]; then
    i=""
elif [[ $e == 50* ]]; then
    i=""
fi
echo "$i $t"
