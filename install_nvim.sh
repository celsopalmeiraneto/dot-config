#!/bin/bash

set -euo pipefail

BOLD="$(tput bold 2>/dev/null || true)"
GREEN="$(tput setaf 2 2>/dev/null || true)"
RED="$(tput setaf 1 2>/dev/null || true)"
RESET="$(tput sgr0 2>/dev/null || true)"

NEOVIM_VERSION="0.12.4"
INSTALL_PREFIX="/usr/local"

if command -v nvim &> /dev/null; then
    echo "${GREEN}✔${RESET} nvim is already installed."
    exit 0
fi

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)  TARBALL="nvim-linux-x86_64.tar.gz"   ;;
    aarch64) TARBALL="nvim-linux-arm64.tar.gz"     ;;
    *)
        echo "${RED}✖${RESET} Unsupported architecture: ${BOLD}$ARCH${RESET}" >&2
        exit 1
        ;;
esac

DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/v${NEOVIM_VERSION}/${TARBALL}"
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Downloading Neovim v${NEOVIM_VERSION} for ${BOLD}${ARCH}${RESET}..."
curl -fsSL -o "${TMP_DIR}/${TARBALL}" "$DOWNLOAD_URL"

echo "Extracting..."
tar xzf "${TMP_DIR}/${TARBALL}" -C "$TMP_DIR"
EXTRACTED_DIR="${TMP_DIR}/nvim-linux-${ARCH}"

echo "Installing to ${BOLD}${INSTALL_PREFIX}${RESET}..."
sudo cp "${EXTRACTED_DIR}/bin/nvim" "${INSTALL_PREFIX}/bin/"
sudo cp -r "${EXTRACTED_DIR}/share/nvim" "${INSTALL_PREFIX}/share/"
sudo cp -r "${EXTRACTED_DIR}/lib/nvim" "${INSTALL_PREFIX}/lib/"

echo "${GREEN}✔${RESET} Neovim v${NEOVIM_VERSION} installed."
