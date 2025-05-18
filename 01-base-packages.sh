#!/bin/bash
# Install core Debian packages & tools for development

set -e

echo "Updating package lists..."
sudo apt update

echo "Installing core packages: git, curl, wget, build-essential, etc."
sudo apt install -y \
    git \
    curl \
    wget \
    build-essential \
    ca-certificates \
    software-properties-common \
    apt-transport-https \
    gnupg \
    lsb-release \
    unzip \
    jq

echo "Base packages installed."
