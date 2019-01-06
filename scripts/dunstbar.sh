#!/bin/bash

length=25


volume=$( pactl list sinks | perl -000ne 'if(/#0/){/(Volume:.*)/; print "$1\n"}' | awk '{print $5}' )
volume=${volume//%/}

function bar {
    length=$1
    value=$2
    title=$3
    notification=$4
    
    step=$(( $value / (100 / $length) ))
    (($step == 0 )) && step=1
    (($step > $length )) && step=$length

    for i in $(seq $(( $step - 1 ))); do
	lefts+='─'
    done

    middles='|'

    for i in $(seq $(( $length - $step -1 ))); do
	rights+='─'
    done

    dunstify --replace=$notification $title "${lefts}${middles}${rights}" 
}
