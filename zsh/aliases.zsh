#!/usr/bin/env bash

# General
alias flushdns='sudo killall -HUP mDNSResponder'
alias ip='ipconfig getifaddr en0'
alias myip='curl -s http://checkip.dyndns.org | sed "s/[a-zA-Z<>/ :]//g"'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias mtnc="brewupdate; upgrade_oh_my_zsh; cd ~/Homestead && git pull; composer global update"

# Cli tools
function spark() { php ~/Sites/internal/spark-installer/spark $* }
function pc() { php ~/Sites/internal/project-cli/project-cli $* }

# Homestead
function homestead() { ( cd ~/Homestead && vagrant $* ) }
alias hu='homestead up'
alias he='(open ~/Homestead/Homestead.yaml)'
alias vm='ssh vagrant@127.0.0.1 -p 2222'

# NPM
alias nw='npm run watch'
alias np='npm run prod'
alias nd='npm run dev'
alias ng='npm run generate'
alias nh='npm run hot'
alias nl='npm run lint'
alias nlf='npm run lintfix'
alias nvm='n $(cat .nvmrc)'
#alias fix-npm='curl -0 -L https://npmjs.com/install.sh | sudo sh && sudo chown -R $USER ~/.n/lib/node_modules'

# Brew
alias brewupdate='brew update && brew upgrade && brew cleanup'

# Direcories
alias p='cd /Users/joris/Sites/projects'

# SSH
alias sshkey='(cat ~/.ssh/id_rsa.pub | pbcopy; echo "Copied SSH Key to clipboard.")'

# GIT
alias gs='git status -s'
alias gcm='git commit -m'
alias go='git checkout'
alias gom='git checkout master'
alias god='git checkout develop'

alias publish='(git checkout develop; git push; git push --tags; git checkout master; git push; git checkout develop)'
alias pull='(git checkout develop; git pull; git pull --tags; git checkout master; git pull; git checkout develop)'
