#!/bin/bash

logo(){
	echo -e '
 ____  _____    __ _____ _____ _____ 
|    \|     |__|  |     |     |     |
|  |  |  |  |  |  |  |  | | | |-   -|
|____/|_____|_____|_____|_|_|_|_____|
powerded by
'
}

color() {
	printf '\033[0;31m%s\033[0m\n' "$1"
}

function pause(){
   read -p "$*"
}

install() {
	if [ -x /usr/bin/git ]; 
	then 
		echo ""
		color " --> Git installed, perfect..."
		pause 'Press [Enter] key to continue...'
		color " --> Installing .bash.... "
		rm -rf $HOME/.bash_files
		git clone https://github.com/DoJoMi/dotbash.git $HOME/.bash
		ln -s $HOME/.bash/.bashrc $HOME/.bashrc
		rm -rf $HOME/.bash/.git
		color " --> Everthing installed.... "
		pause 'Press [Enter] key to continue...'
		echo "***************************************"
		echo "Enter 'source .bashrc' to reload file"
		echo "and 'show' to see more information"
		echo "***************************************"
		else "oO git is not installed... just do it first ;)";
	fi
}

backup() {
	mv $HOME/.bashrc $HOME/.bashrc.bak
}


remove(){
	color " --> Restore to old files and cleaning up..."
	pause 'Press [Enter] key to continue...'
	rm -rf $HOME/.bash 
	rm $HOME/.bashrc
	mv $HOME/.bashrc.bak $HOME/.bashrc
}

while getopts "ir" opt; do
	case $opt in
	i)
		logo
		backup
		install
		;;
	r)
		remove
		;;
	esac
done
