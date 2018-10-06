#!/usr/bin/env bash

# General
alias flushdns='sudo killall -HUP mDNSResponder'
alias ip='ipconfig getifaddr en0'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Homestead
alias hu='homestead up'
alias he='(open ~/Homestead/Homestead.yaml)'
alias vm='ssh vagrant@127.0.0.1 -p 2222'
alias artisan='php artisan'

# NPM
alias nw='npm run watch'
alias np='npm run prod'
alias nd='npm run dev'
alias nvm='n $(cat .nvmrc)'
alias fix-npm='curl -0 -L https://npmjs.com/install.sh | sudo sh && sudo chown -R $USER ~/.n/lib/node_modules'

# Direcories
alias y='cd /Users/joris/Code/y7k-projects'
alias yi='cd /Users/joris/Code/y7k-internal'
alias yc='cd /Users/joris/Code/y7k-craft'

# SSH
alias sshkey='(cat ~/.ssh/id_rsa.pub | pbcopy; echo "Copied SSH Key to clipboard.")'

# GIT
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gp='git push'
alias gc='git commit -v'
alias gd='git diff'
alias go='git checkout'
alias gom='git checkout master'
alias god='git checkout develop'
alias gl='git log --oneline --decorate --all --graph'

alias publish='(git checkout develop; git push; git push --tags; git checkout master; git push; git checkout develop)'
alias pull='(git checkout develop; git pull; git checkout master; git pull; git checkout develop)'
