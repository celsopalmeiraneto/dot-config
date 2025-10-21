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
    sudo apt update
    sudo apt install -y zsh
fi

# Check again if zsh is installed
if ! check_zsh_installed
then
    echo "Failed to install zsh. Exiting."
    exit 1
fi

sudo chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Merge .gitconfig if it exists
if [ -f "$HOME/.gitconfig" ]; then
    echo "Merging existing .gitconfig with new configuration..."
    
    # Add blank line before appending new config
    echo "" >> "$HOME/.gitconfig"
    cat .gitconfig >> "$HOME/.gitconfig"
fi