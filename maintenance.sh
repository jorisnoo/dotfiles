cwd=$(pwd)
brew update
brew upgrade
brew cleanup
upgrade_oh_my_zsh
(cd ~/Homestead && git pull)
composer global update
npm -g upgrade
brew cu -y
cd $cwd