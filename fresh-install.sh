#!/bin/sh

# logging
function e_header() { echo -e "\n\033[1m$@\033[0m"; }

e_header "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

e_header '🍳 Updating homebrew'
brew doctor
brew update

# restore installed apps
e_header '💾 Installing Applications and command line tools'
brew bundle --file=$HOME/.dotfiles/brew/Brewfile

## Remove outdated versions from the cellar.
brew cleanup

e_header '💾 Installed all apps and tools from Brewfile'


e_header 'Install composer'
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

e_header 'Install global Composer packages'
/usr/local/bin/composer global require laravel/installer laravel/valet

e_header 'Install Laravel Valet'
$HOME/.composer/vendor/bin/valet install

e_header 'Symlink config files'
# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
rm -rf $HOME/.mackup.cfg
ln -s $HOME/.dotfiles/mackup/.mackup.cfg $HOME/.mackup.cfg
rm -rf $HOME/.mackup
ln -s $HOME/.dotfiles/mackup/.mackup $HOME/.mackup

e_header 'Installs Node trough n'
sh -c "$(curl -L https://git.io/n-install)"
