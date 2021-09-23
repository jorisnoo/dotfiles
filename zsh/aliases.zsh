#!/usr/bin/env bash

# General
alias flushdns='sudo killall -HUP mDNSResponder'
alias ip='ipconfig getifaddr en0'
alias myip='curl -s http://checkip.dyndns.org | sed "s/[a-zA-Z<>/ :]//g"'
alias mtnc='. $DOTFILES/maintenance.fish'
alias brewupdate='brew update; brew upgrade; brew cleanup'
alias dot='phpstorm $DOTFILES'

# Homestead
homestead() {(cd ~/Homestead && vagrant $*)}
alias hu='homestead up'
alias he='phpstorm ~/Homestead/Homestead.yaml'
alias vm='ssh vagrant@127.0.0.1 -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

# Laravel
alias art='nocorrect artisan'
alias t='composer test'
alias td='php artisan dusk'
alias tdf='php artisan dusk:fails'
alias ta='t; td'
alias ads='php artisan dump-server'
alias sail='bash vendor/bin/sail'
alias sart='sail artisan'

# Composer
#alias composer='php -d memory_limit=-1 `which composer`'
#alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'
alias cup='composer update'
alias cda='composer dump-autoload'
alias cod='composer outdated -D'

# NPM
alias nvm='n $(cat .nvmrc)'
alias nrw='npm run watch'
alias nrp='npm run prod'
alias nrd='npm run dev'
alias nrb='npm run build'
alias nrg='npm run generate'
alias nrh='npm run hot'
alias nrl='npm run lint'
alias nlg='npm -g list --depth=0'
alias ncs='npm-check --skip-unused'

# Directories
alias p='cd ~/Sites/projects'

# SSH
alias sshkey='(cat ~/.ssh/id_rsa.pub | pbcopy; echo "Copied SSH Key to clipboard.")'

# git
alias gs='git status -s'
alias gcm='git commit -m'
alias gpp='git pull && git push'
alias go='git checkout'
alias gom='git checkout main'
alias gomas='git checkout master'
alias god='git checkout develop'
alias gupp='git pull --rebase && git push'
alias grh1='git reset HEAD~1 --soft'
alias grhh1='git reset HEAD~1 --hard'

rename-master-to-main() {
    git branch -m master main
}

# Merge develop into main
release() {(
    git checkout main;
    git pull --rebase;
    git merge --no-ff --no-edit develop;
    git checkout develop;
    git merge --no-edit main
)}

#release-into-master() {(
#    git checkout master;
#    git pull;
#    git merge --no-ff --no-edit develop;
#    git checkout develop;
#    git merge --no-edit master
#)}

# Push main and develop
publish() {(
    git checkout develop; git push; git push --tags;
    git checkout main; git push; git checkout develop
)}

#publish-master() {(
#    git checkout develop; git push; git push --tags;
#    git checkout master; git push; git checkout develop
#)}

alias rnpublish='(release; publish)'

remerge-main() {(
    git checkout main;
    git pull --rebase;
    git checkout develop;
    git merge main
)}

#  Pull and rebase
pull() {(
    git fetch --all --prune;
    git checkout develop; git pull --rebase; git pull --tags;
    git checkout main; git pull --rebase;
    git checkout develop
)}

# Pull and merge
pullmerge() {(
    git fetch --all --prune;
    git checkout develop; git pull; git pull --tags;
    git checkout main; git pull;
    git checkout develop
)}

#ncu-commit() { (
#    ncu -u;
#    npm i;
#    npm audit fix;
#    git add package*;
#    git commit -m 'Upgrade: Node modules';
#)}
#
#cu-commit() { (
#    composer update;
#    git add composer.lock;
#    git commit -m 'Upgrade: Composer packages';
#)}

#LSD
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
