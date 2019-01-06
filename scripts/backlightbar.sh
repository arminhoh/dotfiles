#!/bin/bash

notificaton=$1

. ${HOME}/.local/bin/dunstbar.sh

length=25

bar $length $(xbacklight -get) "Backlight" $notificaton
