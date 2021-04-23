#!/bin/bash

LENGTH=$1
TYPE=$2

if [[ $TYPE == "" || $TYPE == "full" ]]; then
    tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c $LENGTH; echo
fi

if [[ $TYPE == "basic" ]]; then
    tr -dc A-Za-z0-9 </dev/urandom | head -c $LENGTH; echo ''
fi
