#!/bin/bash

touch ~/.hushlogin

# Ensure the directories exists
mkdir -p ~/.config/fish
mkdir -p ~/.config/fish/conf.d
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty

# Remove the existing file/symlinks if they exists
rm -f ~/.config/fish/fish_plugins
rm -f ~/.config/fish/conf.d/user_paths.fish
rm -f ~/.config/fish/conf.d/env_vars.fish
rm -r ~/Library/Application\ Support/com.mitchellh.ghostty/config

# Create the symlinks
ln -sf "$(pwd)/fish/fish_plugins" ~/.config/fish/fish_plugins
ln -sf "$(pwd)/fish/user_paths.fish" ~/.config/fish/conf.d/user_paths.fish
ln -sf "$(pwd)/fish/env_vars.fish" ~/.config/fish/conf.d/env_vars.fish
ln -sf "$(pwd)/config/ghostty" ~/Library/Application\ Support/com.mitchellh.ghostty/config
