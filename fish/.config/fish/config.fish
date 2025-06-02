for aliasfile in /Users/jorge/.dotfiles/config/.config/fish/aliases/*.fish
    source $aliasfile
end

# The next line updates PATH for Netlify's Git Credential Helper.
test -f '/Users/jorge/Library/Preferences/netlify/helper/path.fish.inc' && source '/Users/jorge/Library/Preferences/netlify/helper/path.fish.inc'

