#!/bin/bash

notificaton=$1

. ${HOME}/.local/bin/dunstbar.sh

length=25
default_sink=$( pactl info | grep 'Default Sink' | awk '{print $3}' )

volume=$( pactl list sinks | perl -000ne 'if(/'${default_sink}'/){/(Volume:.*)/; print "$1\n"}' | awk '{print $5}' )
volume=${volume//%/}

bar $length $volume "Volume" $notificaton

