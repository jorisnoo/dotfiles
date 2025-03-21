#!/bin/bash

touch ~/.hushlogin

rm -f ~/.gitignore_global
ln -sf "$(pwd)/git/.gitignore_global" ~/.gitignore_global

brew bundle --file="$(pwd)/homebrew/Brewfile"

stow config
