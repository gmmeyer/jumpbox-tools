#!/bin/bash

# GROS MÉNAGE
cd ~
# Don't delete .ssh otherwise you cannot get in!!
rm -rf .bash* .bin* .cache* .chef* .config* .gitconfig .lesshst .oh-my-zsh .profile .ssh/known_hosts .vim* .zcomp* .zsh*
# In case we are re-running it
rm -rf .jumpbox-tools

# Clone ourselves, or download the tarball if there isn't git.
if command -v git >/dev/null 2>&1; then
    git clone https://github.com/gmmeyer/jumpbox-tools.git ~/.jumpbox-tools
else
    curl -L https://api.github.com/repos/gmmeyer/jumpbox-tools/tarball > jumpbox-tools.tar.gz
    tar -xzf jumpbox-tools.tar.gz
    DIR=$(ls | grep gmmeyer-jumpbox-tools)
    mv $DIR ~/.jumpbox-tools
    rm jumpbox-tools.tar.gz
fi

cd ~/.jumpbox-tools

./installs.sh
./links.sh

exec zsh
