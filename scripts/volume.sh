#!/bin/bash

function get_default_sink() {
    echo $( pactl info | grep 'Default Sink' | awk '{print $3}' )
}
function increase_volume() {
    default_sink=$( get_default_sink )
    pactl set-sink-volume $default_sink "+${1}"
}
function decrease_volume(){
    default_sink=$( get_default_sink )
    pactl set-sink-volume $default_sink "-${1}"
}
function mute(){
    default_sink=$( get_default_sink )
    pactl set-sink-mute $default_sink toggle
}



for i in "$@"
do
    case $i in
	-i=*|--increase=*)
	    VOLUME="${i#*=}"
	    increase_volume $VOLUME
	    ;;
	-d=*|--decrease=*)
	    VOLUME="${i#*=}"
	    decrease_volume $VOLUME
	    ;;
	-m|--mute)
	    mute
	    ;;
	*)
	    echo "unknown option "$i" ; read my source-code, i don't have a help-message."
	    ;;
    esac
done







