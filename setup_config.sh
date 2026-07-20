#!/bin/bash

set -euo pipefail

BOLD="$(tput bold 2>/dev/null || true)"
GREEN="$(tput setaf 2 2>/dev/null || true)"
RED="$(tput setaf 1 2>/dev/null || true)"
RESET="$(tput sgr0 2>/dev/null || true)"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_CONFIG="${SCRIPT_DIR}/.config"
TARGET_CONFIG="$HOME/.config"

mkdir -p "$TARGET_CONFIG"

for dir in "$SOURCE_CONFIG"/*/; do
    name=$(basename "$dir")
    if [ -d "$TARGET_CONFIG/$name" ]; then
        echo "${GREEN}✔${RESET} ${BOLD}${name}${RESET} already exists, skipping."
    else
        echo "Copying ${BOLD}${name}${RESET} to ~/.config..."
        cp -r "$dir" "$TARGET_CONFIG/"
        echo "${GREEN}✔${RESET} ${BOLD}${name}${RESET} copied."
    fi
done
