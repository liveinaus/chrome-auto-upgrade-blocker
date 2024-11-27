# Toggle Google Chrome Auto-Update on macOS

This script allows you to enable or disable automatic updates for Google Chrome on macOS by modifying the Keystone agent configuration.

## Features

- **Disable Auto-Update**: Prevent Chrome from checking for updates by setting the update interval to `0`.
- **Enable Auto-Update**: Restore Chrome's default behavior by removing the update configuration.

## Requirements

- **macOS**
- **Administrator Privileges**: The script requires `sudo` to modify system-level configuration files.

## Usage

### 1. clone the repository

```bash
git clone git@github.com:liveinaus/chrome-auto-upgrade-blocker.git
```

### 2. Make the Script Executable

Run the following command to make the script executable:

```bash
chmod +x mac/toggle_chrome_update.sh
```

#### Disable/enable auto upgrade

Disable

```bash
sudo mac/toggle_chrome_update.sh disable
```

Enable

```bash
sudo mac/toggle_chrome_update.sh enable
```
