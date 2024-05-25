# Store the current directory
set cwd (pwd)

# Upgrade Brew packages
brew update
brew upgrade #--greedy
brew cleanup

# brew uninstall node --ignore-dependencies

# Update Applications:
# mas outdated
# mas upgrade

bun upgrade

# Update git repositories
# cd /Users/jorge/.dotfiles && git pull --recurse-submodules

# Update global composer packages
composer self-update
composer global update

# Backup
mackup backup --force && mackup uninstall

# Upgrade global npm modules
npm upgrade --location=global
ncu -g -u

# Cleanup node versions
n prune

# Change back to the original directory
cd "$cwd" || exit
