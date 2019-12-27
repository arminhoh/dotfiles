#!/bin/bash

config_files="BASEDIR/.config/compton 
BASEDIR/.config/dunst 
BASEDIR/.config/i3 
BASEDIR/.config/gtk-3.0 
BASEDIR/.config/polybar
BASEDIR/.config/emacs"

dot_files="BASEDIR/.shellrc
BASEDIR/.bashrc
BASEDIR/.zshrc
BASEDIR/.ghci"

st_files="BASEDIR/pkg-build/st/config.h
BASEDIR/pkg-build/st/PKGBUILD"

scripts="BASEDIR/backlightbar.sh 
BASEDIR/dunstbar.sh 
BASEDIR/volumebar.sh
BASEDIR/volume.sh"

function import() {
    config_files=${config_files//BASEDIR/${HOME}}
    scripts=${scripts//BASEDIR/${HOME}/.local/bin}
    st_files=${st_files//BASEDIR/${HOME}}
    dot_files=${dot_files//BASEDIR/${HOME}}
    
    rsync -v --recursive ${config_files} ./.config
    rsync -v ${HOME}/.Xresources .
    rsync -v ${scripts} ./scripts
    rsync -v ${st_files} ./pkg-build/st
    rsync -v ${dot_files} .
}
function export() {
    config_files=${config_files//BASEDIR/.}
    scripts=${scripts//BASEDIR/./scripts}
    st_files=${st_files//BASEDIR/.}
    dot_files=${dot_files//BASEDIR/.}}
    
    rsync -n -v --recursive ${config_files} ${HOME}/.config
    rsync -v ./.Xresources ${HOME}
    rsync -v ${scripts} ${HOME}/.local/bin
    rsync -v ${st_files} ${HOME}/pkg-build/st
    rsync -v ${dot_files} ${HOME}
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
