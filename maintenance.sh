# Store the current directory
cwd=$(pwd)

# Check for --full flag
if [[ $* == *-f || $* == *--full ]]; then
    full=true
else
    full=false
fi

if $full; then
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
fi

# Upgrade Brew packages
brew update
brew upgrade

# Upgrade Applications
if $full; then
  brew cu -y
  mas upgrade
fi

# Cleanup Brew packages
brew cleanup

# Upgrade Oh-My-Zsh
upgrade_oh_my_zsh

# Update git repositories
(cd ~/Homestead && git pull)
(cd ~/Sites/internal/spark-installer && git pull)
(cd "$DOTFILES" && git pull --recurse-submodules)

# Update global composer packages
composer global update


if $full; then
    # Update Laravel Valet
    valet install

    # Update vagrant plugins
    vagrant plugin update

    # Check for homestead updates
    # (cd ~/Homestead && vagrant box update)
fi

# Upgrade global npm modules?
npm -g upgrade

# Change back to the original directory
cd "$cwd" || exit
