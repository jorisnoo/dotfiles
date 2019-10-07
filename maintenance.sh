cwd=$(pwd)
brew update
brew upgrade
brew cleanup
upgrade_oh_my_zsh
(cd ~/Homestead && git pull)
(cd ~/Sites/cli/spark-installer && git pull)
composer global update
yarn global upgrade
brew cu -y
cd $cwd