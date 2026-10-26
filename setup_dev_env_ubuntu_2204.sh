#!/bin/bash

# Created 2026/10
# Tested on: Ubuntu desktop (virtual machine)
# 24.04.5 LTS (Noble Numbat)

# This script is adaptation of the UBports docs
# https://docs.ubports.com/en/latest/porting/introduction/Setting_up.html

# If your host PC has a 64-bit architecture (amd64),
# enable the usage of the i386 architecture:

sudo dpkg --add-architecture i386

# Update your package lists to take 
# advantage of the new architecture:
sudo apt update

# Install the required dependencies:
sudo apt install git gnupg flex bison gperf build-essential \
  zip bzr curl libc6-dev libncurses-dev:i386 x11proto-core-dev \
  libx11-dev:i386 libreadline-dev:i386 libgl1:i386 \
  libgl1-mesa-dev g++-multilib mingw-w64-i686-dev tofrodos \
  python3-markdown libxml2-utils xsltproc zlib1g-dev:i386 schedtool \
  liblz4-tool bc lzop imagemagick libncurses6 rsync \
  python-is-python3

# Create a directory named \u2018bin\u2019 in your home 
# directory, and include it in your path:
mkdir -p ~/bin
echo export PATH=\$PATH:\$HOME/bin >> ~/.bashrc
source ~/.bashrc


# Download the repo script and make it executable:
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+rx ~/bin/repo