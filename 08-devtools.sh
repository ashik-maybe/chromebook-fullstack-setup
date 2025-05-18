#!/usr/bin/env bash
set -e

echo "[*] Installing VS Code and GitHub Desktop..."

# Set non-interactive for apt
export DEBIAN_FRONTEND=noninteractive

# --- VS Code Setup ---
echo "[*] Adding Microsoft APT repo for VS Code..."
sudo apt-get install -y wget gpg apt-transport-https debconf-utils

echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

# --- GitHub Desktop Setup ---
echo "[*] Adding unofficial GitHub Desktop repo (ShiftKey build)..."
wget -qO - https://mirror.mwt.me/shiftkey-desktop/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/mwt-desktop.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/mwt-desktop.gpg] https://mirror.mwt.me/shiftkey-desktop/deb/ any main" | sudo tee /etc/apt/sources.list.d/mwt-desktop.list > /dev/null

# --- Final install ---
echo "[*] Updating package list..."
sudo apt update

echo "[*] Installing Visual Studio Code and GitHub Desktop..."
sudo apt install -y code github-desktop

echo "[✓] Installed: VS Code and GitHub Desktop successfully!"
