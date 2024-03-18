eval (/opt/homebrew/bin/brew shellenv)

set -x N_PREFIX "$HOME/.local"
set -gx HOMEBREW_NO_AUTO_UPDATE "1"
set -gx PROJECT_PATHS "$HOME/Sites/projects" "$HOME/Sites/xcode" "$HOME/Sites/packages" "$HOME/Sites/projects/manythingsandlife"
set -gx PHP_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/"
set -gx SSH_AUTH_SOCK "$HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock"

fish_add_path -a "$N_PREFIX/bin"
fish_add_path -a "/opt/homebrew/opt/mysql-client/bin"
fish_add_path -a "$HOME/.local/share/JetBrains/Toolbox/bin"
fish_add_path -a "$HOME/.composer/vendor/bin"
fish_add_path -a "$HOME/Sites/packages/project-content-sync"
fish_add_path -a "$HOME/Library/Preferences/netlify/helper/bin"
fish_add_path -a "$HOME/Library/Application Support/Herd/bin"

# set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications --fontdir=/Library/Fonts"
# set -gx GPG_TTY $(tty)
# set -e NODE_ENV

for aliasfile in ~/.dotfiles/fish/aliases/*.fish
    source $aliasfile
end

#> echo $fish_user_paths | tr " " "\n" | nl
#> set --erase --universal fish_user_paths[1]

# The next line updates PATH for Netlify's Git Credential Helper.
test -f '/Users/jorge/Library/Preferences/netlify/helper/path.fish.inc' && source '/Users/jorge/Library/Preferences/netlify/helper/path.fish.inc'

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
