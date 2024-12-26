#!/bin/bash

if [ $# -eq 0 ]
    then
        echo "This script will save NeoVim's executable at $PWD"
        echo "If this was not the intended path, CTRL + C it and pass the path as an argument."
        sleep 3
else
    $INSTALL_DIRECTORY = $1
    cd $INSTALL_DIRECTORY

fi

# To-do: change it to get the latest automatically, idk how yet.
echo "Downloading NeoVim..."
wget 'https://github.com/neovim/neovim/releases/download/v0.10.2/nvim.appimage'

echo "Downloading NerdFont 'Hack'"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.tar.xz


if !(test -d "$HOME/.fonts/"); then
    echo "No ~/.fonts/ directory found. Creating one."
    mkdir "$HOME/.fonts"
fi

echo "Extracting fonts to ~/.fonts"
tar xf Hack.tar.xz -C "$HOME/.fonts/"
rm Hack.tar.xz 

echo "Refreshing fonts cache"
fc-cache -f -v


echo "Downloading and installing NvChad"
git clone https://github.com/NvChad/starter ~/.config/nvim

echo "Adding executable permissions"
chmod +x nvim.appimage

echo "Everything's done!"
echo "Restart your Terminal Emulator and select the JetBrains Hack font. Then run .$PWD/nvim.appimage"

