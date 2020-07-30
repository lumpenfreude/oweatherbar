# oweatherbar
Extremely simple script to get current weather info for Polybar (and presumably similar bars) from OpenWeatherMaps. Does a curl request, then uses jq, tr, and sed to strip that down to just the current temp and the icon id. Then it just assigns a Font Awesome icon to the icon ID and prints the current conditions. 

# Dependencies

`jq` to clean up the JSON 

# Module

This is how I have it set up on my bar, it updates every 30 minutes. I set it to refresh the entire bar because, well, that will update it. It's a lazy hack but oh well. 
``` 
[module/oweatherbar]
type = custom/script
exec = /home/lump/sources/oweatherbar/oweatherbar.sh
format = <label>°F
foreground-color = ${color.foreground}
interval = 1800
click-left = "exec polybar-msg cmd restart"
click-right = "exec $BROWSER https://www.wunderground.com/weather/(my location)"
``` 
Note that the script doesn't display the degrees symbol or F/C; since people like displaying things differently I didn't want to cramp anyone's style. 

Also the icons are nice and notated so if you use something other than Font Awesome Free you can modify the script pretty easily. Enjoy! 
