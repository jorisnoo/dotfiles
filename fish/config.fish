eval (/opt/homebrew/bin/brew shellenv)

set -x N_PREFIX "$HOME/.local"
fish_add_path -a $N_PREFIX/bin
fish_add_path -a $HOME/.local/share/JetBrains/Toolbox/bin
fish_add_path -a $HOME/.composer/vendor/bin
#fish_add_path -a "./vendor/bin"
fish_add_path -a "$HOME/Library/Preferences/netlify/helper/bin"
fish_add_path /opt/homebrew/opt/mysql-client/bin

set -gx PROJECT_PATHS ~/Sites/projects ~/Sites/projects/manythingsandlife/
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications --fontdir=/Library/Fonts"
set -x GPG_TTY $(tty)

for aliasfile in ~/.dotfiles/fish/aliases/*.fish
    source $aliasfile
end

#> echo $fish_user_paths | tr " " "\n" | nl
#> set --erase --universal fish_user_paths[1]
