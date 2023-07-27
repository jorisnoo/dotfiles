eval (/opt/homebrew/bin/brew shellenv)

set -x N_PREFIX "$HOME/.local"
fish_add_path -a "$N_PREFIX/bin"
fish_add_path -a "$HOME/.local/share/JetBrains/Toolbox/bin"
fish_add_path -a "$HOME/.composer/vendor/bin"
fish_add_path -a "$HOME/Sites/projects/project-content-sync"
fish_add_path -a "$HOME/Library/Preferences/netlify/helper/bin"
fish_add_path -a "$HOME/Library/Application Support/Herd/bin"
# fish_add_path -a "/opt/homebrew/opt/mysql-client/bin"

set -gx PROJECT_PATHS "$HOME/Sites/projects" "$HOME/Sites/projects/manythingsandlife/"
set -gx PHP_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/"
# set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications --fontdir=/Library/Fonts"
# set -gx GPG_TTY $(tty)
# set -e NODE_ENV

for aliasfile in ~/.dotfiles/fish/aliases/*.fish
    source $aliasfile
end

#> echo $fish_user_paths | tr " " "\n" | nl
#> set --erase --universal fish_user_paths[1]
