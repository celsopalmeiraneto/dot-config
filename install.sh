#!/bin/bash

# This function checks if zsh is installed
check_zsh_installed() {
    if command -v zsh &> /dev/null
    then
        return 0
    else
        return 1
    fi
}

# Check if zsh is installed, if not install it
if ! check_zsh_installed
then
    echo "zsh could not be found, installing zsh..."
    apt update
    apt install -y zsh
fi

# Check again if zsh is installed
if ! check_zsh_installed
then
    echo "Failed to install zsh. Exiting."
    exit 1
fi

chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


