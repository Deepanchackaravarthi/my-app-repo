#!/bin/bash

echo "========================================="
echo " Installing Dependencies"
echo "========================================="

# Update system packages
sudo yum update -y

# Install Node.js (change version as needed)
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Verify installation
echo "Node version: $(node -v)"
echo "NPM version: $(npm -v)"

# Install PM2 process manager globally
sudo npm install -g pm2

echo "✅ Dependencies installed successfully!"
