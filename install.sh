#!/bin/bash

# Function to check if a command is installed, if not install it
install_if_missing() {
    local cmd=$1
    local package=$2
    
    if ! command -v $cmd &> /dev/null
    then
        echo "$package not found. Installing..."
        sudo apt-get install -y $package
    else
        echo "$package is already installed."
    fi
}

sudo apt-get update

# Check and install neovim
./install_nvim.sh

# Check and install btop
install_if_missing "btop" "btop"

# Install OpenCode
curl -fsSL https://opencode.ai/install | bash

# Setup Config Files
./setup_config.sh

# Setup Aliases
. ./aliases.sh

# Setup Shares
. ./setup_shares.sh

echo "Setup completed."
