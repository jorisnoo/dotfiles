abbr -a p 'cd ~/Sites/projects'
alias pg='cd ~/Sites/playground'
alias s='cd ~/Sites'
alias dot='phpstorm ~/.dotfiles'

alias brewupdate='brew update; brew upgrade; brew cleanup'
alias mtnc='fish ~/.dotfiles/maintenance.fish'
alias hash='htpasswd -nbBC 10 USER '
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias wttr='curl wttr.in'
alias ipinfo='curl ipinfo.io'
alias o='open .'

alias tp='open -a ~/Applications/Setapp/TablePlus.app/'

alias 'mackup-backup'='mackup backup --force && mackup uninstall --force'
