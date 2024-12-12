#!/bin/bash

if [ $# -eq 0 ]
    then
        echo "This script will save NeoVim's executable at $PWD"
        echo "If this was not the intended path, CTRL + C it and pass the path as an argument."
else
    $INSTALL_DIRECTORY = $1
    cd $INSTALL_DIRECTORY

fi

# To-do: change it to get the latest automatically, idk how yet.
echo "Downloading NeoVim..."
wget 'https://github.com/neovim/neovim/releases/download/v0.10.2/nvim.appimage'

echo "Downloading NerdFont 'Hack'"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip


if !(test -d $HOME/.fonts/); then
    echo "No ~/.fonts/ directory found. Creating one."
    mkdir $HOME/.fonts
fi

echo "Extracting fonts to ~/.fonts"
tar xf Hack.tar.xz -C $HOME/.fonts/

echo "Refreshing fonts cache"
fc-cache -f -v

echo "Downloading and installing NvChad"
git clone https://github.com/NvChad/starter ~/.config/nvim

