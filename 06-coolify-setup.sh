#!/bin/bash
# Install Docker and Coolify (self-hosted PaaS)

set -e

echo "Installing Docker dependencies..."
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Installing Docker Engine..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

echo "Adding current user to docker group..."
sudo usermod -aG docker "$USER"

echo "Installing Coolify via Docker..."
docker run --rm -it \
  -p 3000:3000 \
  coollabsio/coolify

echo "Setup complete! You can now access Coolify at http://localhost:3000"
