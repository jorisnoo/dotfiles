#!/bin/sh

export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.node/bin:$HOME/.composer/vendor/bin:./vendor/bin:$PATH"

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/Users/joris/.netlify/helper/path.zsh.inc' ]; then source '/Users/joris/.netlify/helper/path.zsh.inc'; fi

# Added by n-install (see http://git.io/n-install-repo).
# export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"