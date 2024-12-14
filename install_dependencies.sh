#!/bin/bash

# Exit on any command failure
set -e

echo "Starting dependency installation..."

# Update package manager
if [ -f /etc/debian_version ]; then
    echo "Detected Debian-based system..."
    sudo apt-get update -y
    sudo apt-get upgrade -y
elif [ -f /etc/redhat-release ]; then
    echo "Detected Red Hat-based system..."
    sudo yum update -y
fi

# Install basic dependencies
echo "Installing required packages..."
sudo apt-get install -y git curl unzip || sudo yum install -y git curl unzip

# Install application-specific dependencies (modify as needed)
if [ -f requirements.txt ]; then
    echo "Installing Python dependencies..."
    sudo apt-get install -y python3 python3-pip || sudo yum install -y python3 python3-pip
    pip3 install -r requirements.txt
elif [ -f package.json ]; then
    echo "Installing Node.js dependencies..."
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs || sudo yum install -y nodejs
    npm install
fi

echo "Dependency installation complete!"
