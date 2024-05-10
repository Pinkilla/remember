#!/bin/bash

# Ask password and remember it for ELAPSED seconds 
#
#
# author pbt
# 17 juin 2023
# licence WTFL

set -eo pipefail

ELAPSED="20m"
#export PASSWORD=""

set -u

usage() {
	local scriptname=$(basename ${0})
	echo "${scriptname} …"
	exit 1
}


# do stuff now

if [[ ${PASSWORD:-"unset"} == "unset" ]]; then 
    read -s -p 'Enter password for ${ELAPSED} : ' PASSWORD
    export PASSWORD
    echo -e "\n"
    (sleep ${ELAPSED} ; unset PASSWORD) &
fi

