#!/bin/bash

# Define the action and the plist file path
action=$1
plist_file="/Library/Google/GoogleSoftwareUpdate/GoogleSoftwareUpdate.bundle/Contents/Resources/com.google.Keystone.Agent.plist"

disable_updates() {
    echo "Disabling Chrome auto-update..."
    
    # Create the directory if it doesn't exist
    sudo mkdir -p "$(dirname "$plist_file")"
    
    # Write the plist file to disable updates
    sudo defaults write "$plist_file" checkInterval -int 0
    
    echo "Chrome auto-update has been disabled."
}

enable_updates() {
    echo "Enabling Chrome auto-update..."
    
    # Remove the plist file if it exists
    if [ -f "$plist_file" ]; then
        sudo rm "$plist_file"
        echo "Chrome auto-update has been enabled."
    else
        echo "Auto-update is already enabled (plist file not found)."
    fi
}

# Determine the action
case $action in
    disable)
        disable_updates
        ;;
    enable)
        enable_updates
        ;;
    *)
        echo "Usage: $0 {disable|enable}"
        ;;
esac