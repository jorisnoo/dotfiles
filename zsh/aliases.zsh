#!/usr/bin/env bash

# General
alias flushdns='sudo killall -HUP mDNSResponder'
alias ip='ipconfig getifaddr en0'
alias myip='curl -s http://checkip.dyndns.org | sed "s/[a-zA-Z<>/ :]//g"'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias mtnc='. $DOTFILES/maintenance.sh'
alias brewupdate='brew update && brew upgrade && brew cleanup'
alias dot='phpstorm $DOTFILES'

# Homestead
function homestead() { (cd ~/Homestead && vagrant $*) }
alias hu='homestead up'
alias he='phpstorm ~/Homestead/Homestead.yaml'
alias vm='ssh vagrant@127.0.0.1 -p 2222'

# Laravel
alias art='nocorrect artisan'
alias t='artisan test'
alias tu='artisan test --group=unit'
alias tf='artisan test --group=feature'
alias td='php artisan dusk'
alias tdf='php artisan dusk:fails'
alias ta='artisan test && php artisan dusk'
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
alias nlf='npm run lint-fix'
alias nlg='npm -g list --depth=0'
alias ncs='npm-check --skip-unused'

# Node
alias nvm='n $(cat .nvmrc)'

# Directories
alias h='cd ~'
alias s='cd ~/Sites'
alias p='cd ~/Sites/projects'
alias i='cd ~/Sites/internal'

# SSH
alias sshkey='(cat ~/.ssh/id_rsa.pub | pbcopy; echo "Copied SSH Key to clipboard.")'

# git
alias gs='git status -s'
alias gcm='git commit -m'
alias go='git checkout'
alias gos='git checkout stable'
alias god='git checkout develop'
alias gupp='git pull --rebase && git push'
alias grh1='git reset HEAD~1 --soft'
alias grhh1='git reset HEAD~1 --hard'

rename-master-to-stable() {
    git branch -m master stable
}

# git flow
fstart() { (git checkout -b feature/"$*" develop) }
ffinish() { (git checkout develop && git merge --no-ff feature/"$*" && git branch -d feature/"$*") }

# Merge develop into stable
release() {(
    git checkout stable;
    git pull --rebase;
    git merge --no-ff --no-edit develop;
    git checkout develop;
    git merge --no-edit stable
)}

# Push stable and develop
alias publish='(
    git checkout develop; git push; git push --tags;
    git checkout stable; git push; git checkout develop)'

alias rnpublish='(release; publish)'

remerge-stable() {(
    git checkout stable;
    git pull --rebase;
    git checkout develop;
    git merge stable
)}

#  Pull and rebase
alias pull='(
    git fetch --all --prune;
    git checkout develop; git pull --rebase; git pull --tags;
    git checkout stable; git pull --rebase;
    git checkout develop)'

# Pull and merge
alias pullmerge='(
    git fetch --all --prune;
    git checkout develop; git pull; git pull --tags;
    git checkout stable; git pull;
    git checkout develop)'

function ncu-commit() { (
    ncu -u;
    npm i;
    git add package*;
    git commit -m 'Upgrade: Node modules';
) }

function cu-commit() { (
    composer update;
    git add composer.lock;
    git commit -m 'Upgrade: Composer packages';
) }

#LSD
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
