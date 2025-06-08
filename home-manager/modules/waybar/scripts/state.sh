#!/usr/bin/env bash 

clients=$(hyprctl -j activewindow)

isFloat=$(echo "$clients" | jq -r '.floating')
Fullscreen=$(echo "$clients" | jq -r '.fullscreen')

state=""

if [[ "$isFloat" == "true" ]]; then
	state="[Floating]"
fi

if [[ "$Fullscreen" == 1 ]]; then 
	state="[Maximized]"

elif [[ "$Fullscreen" == 2 ]]; then
	state="[Fullscreen]"
fi

echo "{\"text\" : \"$state\"}"

