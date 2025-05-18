#!/bin/bash
# Install yarn, pm2, nodemon for Node.js dev workflow

set -e

echo "Installing yarn via npm..."
npm install -g yarn

echo "Installing pm2 globally..."
npm install -g pm2

echo "Installing nodemon globally..."
npm install -g nodemon

echo "Installed versions:"
yarn --version
pm2 --version
nodemon --version
