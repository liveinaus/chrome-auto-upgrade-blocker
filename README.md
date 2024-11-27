# Toggle Google Chrome Auto-Update On/Off on Mac OS and Windows

## Features

- **Disable Auto-Update on Mac OS and Windows**
- **Enable Auto-Update on Mac OS and Windows**

### Toggle Google Chrome Auto-Update (Mac OS)

This script allows you to enable or disable automatic updates for Google Chrome on macOS by modifying the Keystone agent configuration.

#### Requirements

- **macOS**
- **Administrator Privileges**: The script requires `sudo` to modify system-level configuration files.

#### Usage

##### 1. clone the repository

```bash
git clone git@github.com:liveinaus/chrome-auto-upgrade-blocker.git
```

##### 2. Make the Script Executable

Run the following command to make the script executable:

```bash
chmod +x mac/toggle_chrome_update.sh
```

###### Disable/enable auto upgrade

Disable

```bash
sudo mac/toggle_chrome_update.sh disable
```

Enable

```bash
sudo mac/toggle_chrome_update.sh enable
```

### Chrome Auto-Upgrade Blocker (Windows)

This script provides functionality to enable or disable Google Chrome's automatic updates on Windows systems. It manages Google Update services and modifies registry policies to control Chrome's update behavior.

#### Requirements

- **Windows OS** (Tested on Windows 10 and 11)
- **PowerShell** (Run as Administrator)
- **Administrator Privileges**: The script requires elevated permissions to modify system services and registry settings.

#### Usage

##### 1. clone the repository

```bash
git clone git@github.com:liveinaus/chrome-auto-upgrade-blocker.git
```

##### 2. Run PowerShell as Administrator

Right-click on PowerShell and select **Run as Administrator**.

##### 3. Execute the Script

Run the script with the appropriate action:

###### Disable/enable Auto-Update

Disable

```powershell
./win/ToggleChromeUpdate.ps1 -action disable
```

Enable

```powershell
./win/ToggleChromeUpdate.ps1 -action enable
```
