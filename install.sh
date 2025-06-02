#!/bin/bash

touch ~/.hushlogin

brew bundle --file="$(pwd)/homebrew/Brewfile"

# Install Composer
wget https://raw.githubusercontent.com/composer/getcomposer.org/main/web/installer -O - -q | php -- --quiet

stow config
stow fish
stow mackup
