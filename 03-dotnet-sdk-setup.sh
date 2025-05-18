#!/bin/bash
# Install Microsoft .NET SDK for C# backend development

set -e

echo "Installing dependencies for .NET SDK..."
sudo apt update
sudo apt install -y wget apt-transport-https

echo "Adding Microsoft package signing key..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
rm packages.microsoft.gpg

echo "Adding Microsoft package repository..."
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" | sudo tee /etc/apt/sources.list.d/dotnet.list

echo "Updating package lists..."
sudo apt update

echo "Installing .NET SDK..."
sudo apt install -y dotnet-sdk-7.0

echo ".NET SDK installed:"
dotnet --version
