#!/bin/bash
# Performance and speed tweaks for Debian on low-end Chromebook

set -e

echo "Disabling unnecessary services..."

# Disable bluetooth if not needed
sudo systemctl disable bluetooth.service --now

# Enable zram for swap (improves swap performance)
echo "Setting up zram for swap..."
sudo apt install -y zram-tools
sudo systemctl enable --now zramswap.service

echo "Reducing swappiness..."
sudo sysctl vm.swappiness=10

# Make swappiness persistent
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf

echo "Disabling systemd journal persistent storage to save disk space..."
sudo mkdir -p /etc/systemd/journald.conf.d
echo -e "[Journal]\nStorage=volatile" | sudo tee /etc/systemd/journald.conf.d/volatile.conf
sudo systemctl restart systemd-journald

echo "Performance tweaks applied."
