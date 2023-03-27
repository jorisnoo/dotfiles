# Store the current directory
set cwd (pwd)

# Upgrade Brew packages
brew update
brew upgrade #--greedy
brew cleanup

# Update Applications
mas outdated
mas upgrade

# Update git repositories
cd ~/.dotfiles && git pull --recurse-submodules

# Update global composer packages
# sudo composer self-update
composer global update

# Update Laravel Valet
valet install

# Upgrade global npm modules
ncu -g -u
npm upgrade --location=global

# Cleanup node versions
n prune

# Change back to the original directory
cd "$cwd" || exit
