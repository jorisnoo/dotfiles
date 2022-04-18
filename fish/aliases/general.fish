alias p='cd ~/Sites/projects'
alias dot='phpstorm ~/.dotfiles'
alias brewupdate='brew update; brew upgrade; brew cleanup'
alias sshkey='cat ~/.ssh/id_rsa.pub | pbcopy; echo "Copied SSH Key to clipboard."'
alias mtnc='fish ~/.dotfiles/maintenance.fish'
alias hash='htpasswd -nbBC 10 USER '
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

alias docker-prune='docker system prune'
