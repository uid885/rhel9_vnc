#!/bin/bash
# Author   : Christo Deale                  
# Date     : 2024-05-28              
# rhel9_vnc: Utility to Install & Setup VNC on Local Server

# Variables
vncPassword="your_vnc_password"

# Install TigerVNC Server
sudo yum install tigervnc-server -y

# Configure systemd service
sudo systemctl enable vncserver@:1.service
sudo systemctl start vncserver@:1

# Set VNC password
echo "$vncPassword" | vncpasswd -f > ~/.vnc/passwd
chmod 0600 ~/.vnc/passwd

# Restart the VNC service
sudo systemctl restart vncserver@:1.service

# Verify VNC service status
sudo systemctl status vncserver@:1.service
