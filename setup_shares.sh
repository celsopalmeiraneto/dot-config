#!/bin/bash

git config --global core.editor "nvim"

git config --global rerere.enabled true

# Add .local/bin into path 
echo "export PATH=\"\$PATH:\$HOME/.local/bin\"" >> ~/.bashrc

