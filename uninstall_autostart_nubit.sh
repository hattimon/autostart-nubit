#!/bin/bash

# Uninstallation Script for Nubit Autostart Setup

echo "Stopping Nubit service..."
sudo systemctl stop nubit.service

echo "Disabling Nubit service from starting on boot..."
sudo systemctl disable nubit.service

echo "Removing systemd service file..."
sudo rm /etc/systemd/system/nubit.service

echo "Removing Nubit script..."
sudo rm /usr/local/bin/nubit.sh

echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

echo "Optionally removing the repository directory..."
REPO_DIR=$(dirname "$(readlink -f "$0")")
if [ -d "$REPO_DIR" ]; then
  echo "Removing repository directory $REPO_DIR..."
  sudo rm -rf "$REPO_DIR"
fi

echo "Uninstallation completed successfully."
