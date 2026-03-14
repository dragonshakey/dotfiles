#!bin/bash

#Terminate running polybar
killall -q polybar

#Launch polybar
polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar Launched..."
