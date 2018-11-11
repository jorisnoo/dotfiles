#!/bin/sh

# logging
function e_header() { echo -e "\n\033[1m$@\033[0m"; }

e_header "Setting up Mac..."

# Check for Homebrew and install if we don't have it
if [[ $(command -v brew) == "" ]]; then
  e_header '🍳 Installing homebrew'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Dialog Package
brew install "dialog"

# Make dialog available as function
function ask() { dialog --yesno "$@" 6 40; }
function alert() { dialog --msgbox "$@" 6 30; }


if (! ask "Do you want to install the dotfiles?"); then
    exit;
fi


# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


if (ask "Do you want to install all applications?"); then

    e_header '🍳 Updating homebrew'
    brew update

    e_header '💾 Installing Applications and command line tools'
    brew bundle --file=$HOME/.dotfiles/brew/Brewfile

    # Remove outdated versions from the cellar.
    brew cleanup


    # Install vagrant plugins
    if [[ $(command -v vagrant) != "" ]]; then
        vagrant plugin install vagrant-bindfs
        vagrant plugin install vagrant-hostsupdater
    fi

    alert '💾 Installed all apps and tools from Brewfile'
fi


if ( ask "Do you want to install composer?"); then

    e_header 'Installing composer'
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer

    e_header 'Installing global composer packages'
    /usr/local/bin/composer global require laravel/installer laravel/valet

    alert 'Composer was installed!'
fi


if ( ask "Do you want to install Laravel Valet?"); then

    e_header 'Install Laravel Valet'
    $HOME/.composer/vendor/bin/valet install

    alert 'Laravel Valet was installed!'
fi



if ( ask "Do you want to install node (tj/n)?"); then

    e_header 'Installing node trough tj/n'
    sh -c "$(curl -L https://git.io/n-install)" -- -y -n

    alert 'Installed node!'
fi


if ( ask "Do you want to install Laravel Homestead?"); then

    e_header 'Installing Laravel Homestead'
    vagrant box add laravel/homestead
    git clone https://github.com/laravel/homestead.git $HOME/Homestead

    alert 'Installed Laravel Homestead!'

    e_header 'Symlink Homestead config files'
    rm -rf $HOME/Homestead/after.sh $HOME/Homestead/aliases
    ln -s $HOME/.dotfiles/Homestead/after.sh $HOME/Homestead/after.sh
    ln -s $HOME/.dotfiles/Homestead/aliases $HOME/Homestead/aliases

    alert 'Symlinked Laravel Homestead config files!'
fi


if ( ask "Do you want to symlink zsh and mackup configuration files?"); then

    e_header 'Symlink ZSH config files'
    # Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
    rm -rf $HOME/.zshrc
    ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc

    alert 'Symlinked ZSH config files!'

    e_header 'Symlink Mackup config files'
    # Symlink the Mackup config file to the home directory
    rm -rf $HOME/.mackup.cfg $HOME/.mackup
    ln -s $HOME/.dotfiles/mackup/.mackup.cfg $HOME/.mackup.cfg
    ln -s $HOME/.dotfiles/mackup/.mackup $HOME/.mackup

    alert 'Symlinked Mackup config files!'
fi


if ( ask "Do you want to apply the .macos settings?"); then

    sh macos/.macos

    alert 'Applied .macos settings!'
fi


alert '🍺 YAY! 🍺'
