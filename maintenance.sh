cwd=$(pwd)

brew update
brew upgrade

# Delete git completion in order for git flow completion to work
rm -f /usr/local/share/zsh/site-functions/_git

brew cu -y
mas upgrade

brew cleanup

upgrade_oh_my_zsh

(cd ~/Homestead && git pull)
(cd ~/Sites/internal/spark-installer && git pull)

composer global update

npm -g upgrade

vagrant plugin update

cd $cwd