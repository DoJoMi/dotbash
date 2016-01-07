#!/bin/sh

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

pause(){
   read -p "$*"
}

install() {
	if [ -x /usr/bin/git ] || [ -x /usr/local/bin/git ];
	then 
		echo ""
		color " --> Git installed, perfect..."
		pause 'Press [Enter] key to continue...'
		  if [ -d "$HOME/.bash" ]; then
   			color " --> Directory exists no fresh cloning..."
			ln -s $HOME/.bash/.bashrc $HOME/.bashrc
			rm -rf $HOME/.bash/.git
			pause 'Press [Enter] key to continue...'
			echo "***************************************"
			echo "Enter 'source .bashrc' to reload file & 'show' for included functions"
			echo "***************************************"
		  else
			git clone https://github.com/DoJoMi/dotbash.git $HOME/.bash
			ln -s $HOME/.bash/.bashrc $HOME/.bashrc
			rm -rf $HOME/.bash/.git
			pause 'Press [Enter] key to continue...'
			echo "***************************************"
			echo "Enter 'source .bashrc' to reload file & 'show' for included functions"
			echo "***************************************"
		  fi
	 else "oO git is not installed... just do it first ;)";
	fi
}

skel(){
    if [ -d "$HOME/.bash" ]; then
        color " --> Directory exists no new repo cloning..."
        pause 'Press [Enter] key to continue copying files to /etc/skel...'
        sudo -s rm /etc/skel/.bash_profile /etc/skel/.bashrc
        sudo -s cp -R $HOME/.bash/.install/ $HOME/.bash/.bash_files/ $HOME/.bash/.bash_profile $HOME/.bash/.bashrc /etc/skel
        sudo -s sed -i 's@$HOME/.bash/.bash_files/*@$HOME/.bash_files/@' /etc/skel/.bashrc
        echo "***************************************"
        echo "Now basic .bashrc is available for all new created users"
        echo "***************************************"
    else
        color " --> Clone repo .... "
        git clone https://github.com/DoJoMi/dotbash.git $HOME/.bash
        pause 'Press [Enter] key to continue copying files to /etc/skel...'
        sudo -s rm /etc/skel/.bash_profile /etc/skel/.bashrc
        sudo -s cp -R $HOME/.bash/.install/ $HOME/.bash/.bash_files/ $HOME/.bash/.bash_profile $HOME/.bash/.bashrc /etc/skel
        sudo -s sed -i 's@$HOME/.bash/.bash_files/*@$HOME/.bash_files/@' /etc/skel/.bashrc
        echo "***************************************"
        echo "Now basic .bashrc is available for all new created users"
        echo "***************************************"
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

while getopts "isr" opt; do
	case $opt in
	i)
		logo
		backup
		install
		;;
	s)
		logo
		skel
		;;
	r)
		logo
		remove
		;;

	esac
done
