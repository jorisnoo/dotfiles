set -gx N_PREFIX "$HOME/.local"
set -gx HOMEBREW_NO_AUTO_UPDATE "1"
set -gx HOMEBREW_CASK_OPTS "--fontdir=$HOME/Library/Fonts"
set -gx PHP_INI_SCAN_DIR "$HOME/Library/Application Support/Herd/config/php/"
set -gx SSH_AUTH_SOCK "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
set -gx PROJECT_PATHS \
    "$HOME/Sites/projects" \
    "$HOME/Sites/xcode" \
    "$HOME/Sites/playground" \
    "$HOME/Sites/packages" \
    "$HOME/Sites/projects/manythingsandlife"
