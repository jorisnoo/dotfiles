#!/usr/bin/env bash

# General
alias flushdns='sudo killall -HUP mDNSResponder'
alias ip='ipconfig getifaddr en0'
alias myip='curl -s http://checkip.dyndns.org | sed "s/[a-zA-Z<>/ :]//g"'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias mtnc='. ~/.dotfiles/maintenance.sh'
alias brewupdate='brew update && brew upgrade && brew cleanup'
alias dot='code ~/.dotfiles'

# CLI tools
function spark() { php ~/Sites/cli/spark-installer/spark $* }
function pc() { php ~/Sites/cli/project-cli/project-cli $* }

# Homestead
function homestead() { ( cd ~/Homestead && vagrant $* ) }
alias hu='homestead up'
alias he='(open ~/Homestead/Homestead.yaml)'
alias vm='ssh vagrant@127.0.0.1 -p 2222'

# Laravel
alias art='artisan'
alias t='phpunit'
alias td='php artisan dusk'
alias tdf='php artisan dusk:fails'
alias ta='phpunit && php artisan dusk'
alias ads='php artisan dump-server'

# NPM
alias nw='npm run watch'
alias np='npm run prod'
alias nd='npm run dev'
alias nb='npm run build'
alias ng='npm run generate'
alias nh='npm run hot'
alias nl='npm run lint'
alias nlf='npm run lintfix'
alias nvm='n $(cat .nvmrc)'
alias npm-lg='npm -g list --depth=0'

# Direcories
alias h='cd ~'
alias s='cd ~/Sites'
alias p='cd ~/Sites/projects'

# SSH
alias sshkey='(cat ~/.ssh/id_rsa.pub | pbcopy; echo "Copied SSH Key to clipboard.")'

# GIT
alias gs='git status -s'
alias gcm='git commit -m'
alias go='git checkout'
alias gom='git checkout master'
alias god='git checkout develop'
alias gupp='git pull --rebase && git push'
alias grh1='git reset HEAD~1 --soft'
alias grhh1='git reset HEAD~1 --hard'

alias publish='(git checkout develop; git push; git push --tags; git checkout master; git push; git checkout develop)'
alias pullm='(git fetch --all --prune; git checkout develop; git pull; git pull --tags; git checkout master; git pull; git checkout develop)'
alias pull='(git fetch --all --prune; git checkout develop; git pull --rebase; git pull --tags; git checkout master; git pull --rebase; git checkout develop)'

#LSD
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'