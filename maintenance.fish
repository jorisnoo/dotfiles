# Store the current directory
set cwd (pwd)

# Upgrade Brew packages
brew update
brew upgrade #--greedy
brew cleanup

# Update Applications
mas outdated
mas upgrade

# Update global composer packages
composer self-update
composer global update

fisher update

# Upgrade global npm modules
npm upgrade --location=global
ncu -g -u

# Cleanup node versions
n prune

# Backup
mackup backup --force && mackup uninstall --force

# Change back to the original directory
cd "$cwd" || exit
