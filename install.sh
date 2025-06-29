#!/bin/bash
# TODO
# convert to makefile (see TJ) 

DOTFILES=$HOME/dotfiles/

sudo apt-get update
sudo apt-get install -y build-essential \
    git \
    cmake \
    stow \
    zsh \
    tmux \
    curl \
    wget \
    unzip \
    zip \
    tar \
    # npm \
    cargo \
    python3.10-venv \
    luarocks \
    gnome-tweaks \
    libboost-all-dev \
    libusb-1.0-0-dev
# Is python installed with npm?
# Do we just install all pip stuff on the global python?

# Dofiles setup
DOTFILES=$HOME/dotfiles/
STOW_FOLDERS="tmux,zsh,nvim"
pushd "$DOTFILES" || exit
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    stow -R "$folder"
done
popd || exit

# This has to be after dotfiles
# Node, nvm
export PROFILE=dotfiles/zsh/.config/zsh/.zshrc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
zsh
nvm install node

# TODO: check if target exist, then pull instead
# # Neovim, depends on node, nvm
git clone --depth 1 --branch stable https://github.com/neovim/neovim.git ~/git/neovim
pushd ~/repos/neovim
# git pull
# make distclean
# make CMAKE_BUILD_TYPE=RelWIthDebInfo
make -j2 -s --no-print-directory
sudo make install -s
popd
#
# # After dotfiles
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
# # Programming:
# # python

curl -o get-pip.py https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py

#
# Python
# numpy
# scipy
# komm

# # uhd
# # TODO: we have to make sure pip is in path, so we can install the other stuff
# sudo apt install libboost-all-dev libusb-1.0-0-dev build-essential -y
# # sudo pip install pybind11[global]
# pip install numpy==1.26.4 docutils mako requests ruamel.yaml setuptools
# cd ~
# git clone https://github.com/EttusResearch/uhd.git repos/uhd
# cd repos/uhd
# git checkout v4.8.0.0
# cd host
# mkdir build
# cd build
# cmake -DENABLE_TESTS=OFF -DENABLE_C_API=OFF -DENABLE_PYTHON_API=ON -DENABLE_MANUAL=OFF ..
# make -j8
# sudo make install
# sudo ldconfig
