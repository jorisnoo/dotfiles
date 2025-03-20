eval (/opt/homebrew/bin/brew shellenv)

set -x N_PREFIX "$HOME/.local"
set -gx HOMEBREW_NO_AUTO_UPDATE "1"
set -gx HOMEBREW_CASK_OPTS "--fontdir=/Users/jorge/Library/Fonts"
set -gx PROJECT_PATHS "$HOME/Sites/projects" "$HOME/Sites/xcode" "$HOME/Sites/playground" "$HOME/Sites/packages" "$HOME/Sites/projects/manythingsandlife"
set -gx PHP_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/"
set -gx SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
set -gx BUN_INSTALL "$HOME/.bun"

fish_add_path -a -U "$N_PREFIX/bin"
fish_add_path -a -U "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
fish_add_path -a -U "$HOME/.composer/vendor/bin"
fish_add_path -a -U "$HOME/Sites/packages/project-content-sync"
fish_add_path -a -U "$HOME/Library/Preferences/netlify/helper/bin"
fish_add_path -a -U "$HOME/Library/Application Support/Herd/bin"
fish_add_path -a -U "$BUN_INSTALL/bin"
fish_add_path -a -U "/opt/homebrew/opt/mysql-client/bin"

for aliasfile in /Users/jorge/.dotfiles/fish/aliases/*.fish
    source $aliasfile
end

#> echo $fish_user_paths | tr " " "\n" | nl
#> set --erase --universal fish_user_paths[1]

# The next line updates PATH for Netlify's Git Credential Helper.
test -f '/Users/jorge/Library/Preferences/netlify/helper/path.fish.inc' && source '/Users/jorge/Library/Preferences/netlify/helper/path.fish.inc'
