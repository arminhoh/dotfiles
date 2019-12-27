#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias firefox='env GTK_THEME=Adwaita:light firefox'
alias ls='ls --color=auto'


PS1='[\u@\h \W]\$ '

export PATH="${PATH}:${HOME}/.local/bin/"

. ~/.bash_alias

function crun {
    name=$1
    name=${name/.c/}
    gcc99 ${name}.c -o ${name} && ./${name} "${@:2}"
}

function cbug {
    name=$1
    name=${name/.c/}
    gcc99 -g ${name}.c -o ${name} 
}

function eidp-pack {
    sheet=$(basename $(pwd))
    sheet=${sheet/sheet/blatt}
    tar -vczf 04-hohenegger-${sheet}.tar.gz a*.c a*.txt
}


    


    


