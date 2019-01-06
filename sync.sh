#!/bin/bash

config_files="BASEDIR/.config/compton 
BASEDIR/.config/dunst 
BASEDIR/.config/i3 
BASEDIR/.config/gtk-3.0 
BASEDIR/.config/polybar"

scripts="BASEDIR/backlightbar.sh 
BASEDIR/dunstbar.sh 
BASEDIR/volumebar.sh
BASEDIR/volume.sh"

function import() {
    config_files=${config_files//BASEDIR/${HOME}}
    scripts=${scripts//BASEDIR/${HOME}/.local/bin}
    
    rsync -v --recursive ${config_files} ./.config
    rsync -v ${HOME}/.Xresources .
    rsync -v ${scripts} ./scripts
}
function export() {
    config_files=${config_files//BASEDIR/.}
    scripts=${scripts//BASEDIR/./scripts}
    
    rsync -n -v --recursive ${config_files} ${HOME}/.config
    rsync -v ./.Xresources ${HOME}
    rsync -v ${scripts} ${HOME}/.local/bin
}

case "$1" in
    -i|--import)
	import
	;;
    -e|--export)
	export
	;;
    *)
	echo "--import/-i import dotfiles from homedir to git-repo"
	echo "--export/-e export dotfiles form git-repo to homedir"
	;;
esac
