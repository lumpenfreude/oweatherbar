#!/bin/bash
#ping google to see if we're online so the bar doesn't fill with garbage if it can't find OWM
if ping -q -c 1 -W 1 google.com &> /dev/null; then
    #read the conf file for the needed info
    read a b c <<< $(tr '\n' ' ' <$HOME/.config/wbar.conf)
    #get current weather info from OWM, use jq to strip it down to main temp and the icon id, then strip linebreaks and quotes from it
    read d e <<< $(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$a&appid=$b&units=$c" | jq -r '.main.temp, .weather[].icon' | tr '\n' ' ' | sed "s/\"//g")
    #round the current temp to an integer
    t=$(printf %0.f $d)
    #define the icons 
    i=""
    if [[ $e == 01d ]]; then
        i="" #clear day
    elif [[ $e == 01n ]]; then
        i="" #clear night
    elif [[ $e == 02d ]]; then
        i="" #few clouds day
    elif [[ $e == 02n ]]; then
        i="" #few clouds night
    elif [[ $e == 03* || $e == 04*  ]]; then
        i="" #scattered/broken clouds day/night
    elif [[ $e == 09* ]]; then
        i="" #shower rain day/night
    elif [[ $e == 10d ]]; then
        i="" #rain day
    elif [[ $e == 10n ]]; then
        i="" #rain night
    elif [[ $e == "10d 11d" ]]; then
        i="" #thunderstorm day
    elif [[ $e == "10n 11n" ]]; then
        i="" #thunderstorm night
    elif [[ $e == 11* ]]; then
        i="" #thunderstorm generic
    elif [[ $e == 13* ]]; then
        i="" #snow day/night
    elif [[ $e == 50* ]]; then
        i="" #fog day/night
    fi
    echo "$i $t" #put em together
else
    echo " ??" #if google can't be pinged, show the d/ced icon and ?? degrees
fi
