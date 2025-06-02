# Clear existing paths first
set -e fish_user_paths

fish_add_path "$HOME/Library/Preferences/netlify/helper/bin"
fish_add_path "$N_PREFIX/bin"
fish_add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
fish_add_path "$HOME/.composer/vendor/bin"
fish_add_path "/opt/homebrew/bin"
fish_add_path "/opt/homebrew/sbin"
fish_add_path "$HOME/Library/Application Support/Herd/bin"
# fish_add_path "/opt/homebrew/opt/mysql-client/bin"
# fish_add_path "$BUN_INSTALL/bin"
# fish_add_path "$HOME/Sites/packages/project-content-sync"

#> echo $fish_user_paths | tr " " "\n" | nl
#> set --erase --universal fish_user_paths[1]
