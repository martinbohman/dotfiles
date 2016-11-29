#!/bin bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function install {
	if [ -f $2 ];
	then
		read -p "'$2' already exist. Do you wish to overwrite? (Y/n)" -n 1 -r
		echo
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			mkdir -p `dirname $2`
			ln -fs $DIR/$1 $2
		else
			echo "Skipping '$2'."
		fi
	else
		mkdir -p `dirname $2`
		ln -s $DIR/$1 $2
	fi
}

install gitconfig ~/.gitconfig
# install oh_my_zsh ~/.oh_my_zsh
install zshrc ~/.zshrc
install bash_profile ~/.bash_profile
install bashrc ~/.bashrc
