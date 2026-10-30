#!/bin/bash

# Ask password and remember it for ELAPSED seconds.
#
# Use keyctl. Ask password to the user and store it in linux
# keyring. 

# authors pbt, ante
# avril 2024
# licence WTFL

set -eo pipefail

TIMEOUT="7200" #"1200" # 1200 seconds aka 20 minutes

set -u

usage() {
    local scriptname=$(basename ${0})
    echo "
Remember value like password for a while (default 20m). 

Usage: ${scriptname} <key> [--forget]

Options:
    --forget    Forget (revoke) the stored value for the key
    "

    exit 1
}


# do stuff now

read_passwd() {
    echo -n "value for ${keyname} >>> "
    # save tty conf and disable echo
    stty_orig=$(stty -g)
    stty -echo
    # read and store in keyring
    key=$(head -n 1 | keyctl padd user "user:$keyname" @s)
    keyctl timeout "$key" "$TIMEOUT"
    # restore tty config
    stty "$stty_orig"
}

get_passwd() {
    if ! key=$(keyctl request user "user:$keyname" 2>/dev/null); 
    then
        read_passwd $keyname 
    fi 
    keyctl pipe "$key"
}

forget_passwd() {
    if key=$(keyctl request user "user:$keyname" 2>/dev/null); then
        keyctl revoke "$key"
        echo "Value for '${keyname}' forgotten." >&2
    else
        echo "No value stored for '${keyname}'." >&2
    fi
}

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    usage
fi

keyname=$1

if [ "$#" -eq 2 ]; then
    if [ "$2" = "--forget" ]; then
        forget_passwd $keyname
    else
        usage
    fi
else
    get_passwd $keyname
fi