#!/bin/bash

# Check if hostname contains "shares"
if ! uname -a | grep -q "shares"; then
    echo "Host is does not contain 'shares' in its name. Exiting."
    exit 0
fi

git config --global core.editor "nvim"
