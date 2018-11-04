#!/bin/sh

export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.node/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH

export PATH=$HOME/Code/y7k-internal/cli:$PATH

export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).