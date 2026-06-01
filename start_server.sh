#!/bin/bash

echo "========================================="
echo " Starting Application"
echo "========================================="

APP_DIR="/home/ec2-user/my-app"

cd $APP_DIR

# Install app-level dependencies
npm install --production

# Stop existing PM2 process if running
pm2 stop my-app 2>/dev/null || true
pm2 delete my-app 2>/dev/null || true

# Start the app using PM2
pm2 start src/index.js --name "my-app"

# Save PM2 process list (survives reboot)
pm2 save

# Enable PM2 on system startup
sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u ec2-user --hp /home/ec2-user

echo "✅ Application started successfully!"
pm2 status
