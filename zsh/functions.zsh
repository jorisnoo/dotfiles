#!/usr/bin/env bash

composer-link() {
    composer config repositories.local '{"type": "path", "url": "'$1'"}' --file composer.json
}

# Opens any file in MacOS Quicklook Preview
ql () { qlmanage -p "$*" >& /dev/null; }

# Create a new directory and enter it
mkd () {
    mkdir -p "$@" && cd "$_";
}

# Change working directory to the top-most Finder window location
cdf () {
    target=$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')
    if [ "$target" != "" ]; then
        cd "$target" || exit; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# Optimize Images
optim () {
    if [ -z "$1" ] ; then
        open -a Optimage "."
    else
        rsync -av --progress $1/  $1-min/
        open -a Optimage $1-min
    fi
}

# To create a ZIP archive of a folder
zipf () { zip -r "$1".zip "$1" ; }

# Determine size of a file or total size of a directory
fs () {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@";
    else
        du $arg .[^.]* ./*;
    fi;
}

# Create a data URL from a file
dataurl () {
    local mimeType=$(file -b --mime-type "$1");
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8";
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
json () {
    if [ -t 0 ]; then # argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript;
    else # pipe
        python -mjson.tool | pygmentize -l javascript;
    fi;
}

# Run `dig` and display the most useful info
digga () {
    dig +nocmd "$1" +multiline +noall +answer;
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
o () {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
tre () {
    tree -aC -I '.git|node_modules|.idea' --dirsfirst "$@" | less -FRNX;
}

# display useful host related informaton
ii () {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Current network location :$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address :$NC " ; myip
    # echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}

# remove all local branches that are already merged in the current active branch
cleangit () {
    echo -e "WARNING: If you're on, say, a development branch that was branched off of master, you'll lose your master branch";
    echo -e "still want to do this? [y/N]";
    read REMOVE
    if [ "$REMOVE" = "y" ] || [ "$REMOVE" = "Y" ]; then
        git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d
    fi
}


# Start an HTTP server from a directory, optionally specifying the port
# server () {
#     local port="${1:-8000}";
#     sleep 1 && open "http://localhost:${port}/" &
#     # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
#     # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
#     python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
# }

# Compare original and gzipped file size
# gz () {
#     local origsize=$(wc -c < "$1");
#     local gzipsize=$(gzip -c "$1" | wc -c);
#     local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
#     printf "orig: %d bytes\n" "$origsize";
#     printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
# }


# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
# targz () {
#     local tmpFile="${@%/}.tar";
#     tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

#     size=$(
#         stat -f"%z" "${tmpFile}" 2> /dev/null; # macOS `stat`
#         stat -c"%s" "${tmpFile}" 2> /dev/null;  # GNU `stat`
#     );

#     local cmd="";
#     if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
#         # the .tar file is smaller than 50 MB and Zopfli is available; use it
#         cmd="zopfli";
#     else
#         if hash pigz 2> /dev/null; then
#             cmd="pigz";
#         else
#             cmd="gzip";
#         fi;
#     fi;

#     echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…";
#     "${cmd}" -v "${tmpFile}" || return 1;
#     [ -f "${tmpFile}" ] && rm "${tmpFile}";

#     zippedSize=$(
#         stat -f"%z" "${tmpFile}.gz" 2> /dev/null; # macOS `stat`
#         stat -c"%s" "${tmpFile}.gz" 2> /dev/null; # GNU `stat`
#     );

#     echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully.";
# }

# Extract most know archives with one command
extract () {
 if [ -f $1 ] ; then
  case $1 in
    *.tar.bz2)   tar xjf $1     ;;
    *.tar.gz)    tar xzf $1     ;;
    *.bz2)       bunzip2 $1     ;;
    *.rar)       unrar e $1     ;;
    *.gz)        gunzip $1      ;;
    *.tar)       tar xf $1      ;;
    *.tbz2)      tar xjf $1     ;;
    *.tgz)       tar xzf $1     ;;
    *.zip)       unzip $1       ;;
    *.Z)         uncompress $1  ;;
    *.7z)        7z x $1        ;;
    *)     echo "'$1' cannot be extracted via extract()" ;;
     esac
 else
     echo "'$1' is not a valid file"
 fi
}


# UTF-8-encode a string of Unicode symbols
# escape () {
#     printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u);
#     # print a newline unless we’re piping the output to another program
#     if [ -t 1 ]; then
#         echo ""; # newline
#     fi;
# }

# Decode \x{ABCD}-style Unicode escape sequences
# unidecode () {
#     perl -e "binmode(STDOUT, ':utf8'); print \"$@\"";
#     # print a newline unless we’re piping the output to another program
#     if [ -t 1 ]; then
#         echo ""; # newline
#     fi;
# }

# Get a character’s Unicode code point
# codepoint () {
#     perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))";
#     # print a newline unless we’re piping the output to another program
#     if [ -t 1 ]; then
#         echo ""; # newline
#     fi;
# }
