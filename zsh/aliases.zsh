#!/usr/bin/env bash

# General
alias flushdns='sudo killall -HUP mDNSResponder'
alias ip='ipconfig getifaddr en0'
alias myip='curl -s http://checkip.dyndns.org | sed "s/[a-zA-Z<>/ :]//g"'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias mtnc='. $DOTFILES/maintenance.sh'
alias brewupdate='brew update && brew upgrade && brew cleanup'
alias dot='code $DOTFILES'

# CLI tools
function spark() { php ~/Sites/internal/spark-installer/spark $* }
# function pc() { php ~/Sites/internal/project-cli/project-cli $* }
function c2a() { ~/Sites/internal/csv2actual/bin/run $* }

# Homestead
function homestead() { ( cd ~/Homestead && vagrant $* ) }
alias hu='homestead up'
alias he='(code ~/Homestead/Homestead.yaml)'
alias vm='ssh vagrant@127.0.0.1 -p 2222'

# Laravel
alias art='artisan'
alias t='phpunit'
alias tu='phpunit --testsuite Unit'
alias tf='phpunit --testsuite Feature'
alias td='php artisan dusk'
alias tdf='php artisan dusk:fails'
alias ta='phpunit && php artisan dusk'
alias ads='php artisan dump-server'

# Composer
alias cup='composer update'
alias cda='composer dump-autoload'

# NPM
alias nw='npm run watch'
alias nprod='npm run prod'
alias nd='npm run dev'
alias nb='npm run build'
alias ng='npm run generate'
alias nh='npm run hot'
alias nl='npm run lint'
alias nlf='npm run lintfix'
alias nlg='npm -g list --depth=0'
alias ncs='npm-check --skip-unused'

# Node
alias nvm='$(cat .nvmrc)'
# alias nvm='volta pin node@$(cat .nvmrc)'
alias vin='volta install node@$(cat .nvmrc)'
alias vpn='volta pin node@$(cat .nvmrc)'
alias vl='volta list --format=plain'

# Direcories
alias h='cd ~'
alias s='cd ~/Sites'
alias p='cd ~/Sites/projects'
alias i='cd ~/Sites/internal'

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

# Merge develop into master
alias mtm='( 
    git checkout master;
    git pull --rebase;
    git merge --no-ff --no-edit develop; 
    git checkout develop;
    git merge --no-edit master)'

# Push master and develop
alias publish='(
    git checkout develop; git push; git push --tags; 
    git checkout master; git push; git checkout develop)'

alias mtmp='mtm && publish'

#  Pull and rebase
alias pull='(
    git fetch --all --prune;
    git checkout develop; git pull --rebase; git pull --tags; 
    git checkout master; git pull --rebase;
    git checkout develop)'

# Pull and merge
alias pullm='(
    git fetch --all --prune;
    git checkout develop; git pull; git pull --tags;
    git checkout master; git pull;
    git checkout develop)'

#LSD
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'