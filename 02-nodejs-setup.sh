#!/bin/bash
# Install Node.js LTS from tarball URL (update NODEJS_TARBALL_URL to latest LTS if needed)

set -e

# URL for Node.js LTS tarball, edit to update Node version
NODEJS_TARBALL_URL="https://nodejs.org/dist/v22.15.1/node-v22.15.1-linux-x64.tar.xz"

echo "Downloading Node.js LTS tarball from $NODEJS_TARBALL_URL ..."
curl -LO "$NODEJS_TARBALL_URL"

echo "Extracting Node.js..."
tar -xf node-v*-linux-x64.tar.xz

echo "Installing Node.js to /usr/local/nodejs ..."
sudo rm -rf /usr/local/nodejs
sudo mv node-v*-linux-x64 /usr/local/nodejs

echo "Setting up symlinks..."
sudo ln -sf /usr/local/nodejs/bin/node /usr/bin/node
sudo ln -sf /usr/local/nodejs/bin/npm /usr/bin/npm
sudo ln -sf /usr/local/nodejs/bin/npx /usr/bin/npx

echo "Cleaning up..."
rm node-v*-linux-x64.tar.xz

echo "Node.js LTS installed:"
node -v
npm -v
