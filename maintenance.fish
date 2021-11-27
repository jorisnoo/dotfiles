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
cd ~/.dotfiles && git pull --recurse-submodules

# Update global composer packages
composer global update

# Update Laravel Valet
valet install

# Upgrade global npm modules
npm -g upgrade

# Change back to the original directory
cd "$cwd" || exit
