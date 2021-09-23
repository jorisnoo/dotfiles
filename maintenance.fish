# Store the current directory
set cwd (pwd)

# Upgrade Brew packages
brewupdate

# Update Applications
brew cu -y
mas outdated
mas upgrade

# Cleanup Brew packages
brew cleanup

# Update git repositories
#(cd ~/Homestead && git pull)
cd ~/.dotfiles && git pull --recurse-submodules

# Update global composer packages
composer global update

# Upgrade global npm modules
npm -g upgrade

# Update Laravel Valet
#valet install

# Update vagrant plugins
# vagrant plugin update

# Check for homestead updates
# (cd ~/Homestead && vagrant box update)

# Upgrade Oh-My-Zsh
#omz update

# Change back to the original directory
cd "$cwd" || exit
