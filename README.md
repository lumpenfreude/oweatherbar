# oweatherbar

![](/pic.png)

Simple Bash script to scraped info from OpenWeatherMaps, parse it with JQ, and then spit it out to whatever bar you're using.

# Dependencies

`jq` to clean up the JSON 

`Font Awesome 5 Free` icons (though it may work natively with some other icon packs, and can be easily edited to work with others)

![](/pic2.png)

# Installation & Module

Just put it wherever you want and put it in your bar! 

It requires a small .conf file (wbar.conf) to be placed in your config folder. If you don't like this location, it's trivial enough to change in the script. This .conf file contains your location (whatever's after the q?= when you do a search on OpenWeatherMaps), your API key, and whether you want imperial or metric units. 

Here's a basic module setup for Polybar. 
``` 
[module/oweatherbar]
type = custom/script
exec = /path/to/oweatherbar.sh
format = <label>°F ## or °C
foreground-color = ${color.foreground}
interval = 1800
``` 
Note that the script doesn't display the degrees symbol or F/C; since people like displaying things differently I didn't want to cramp anyone's style. 

Also the icons are nice and notated so if you use something other than Font Awesome you can modify the script pretty easily. Enjoy! 
