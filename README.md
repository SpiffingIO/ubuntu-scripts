# Ubuntu Scripts

This repository includes a collection of scripts required to set up an Ubuntu workstation.

## Install

The `install.sh` script contains an install script that installs the most common dependencies for the engineering team.

To run the script, you can download it using `wget`:

```
wget https://raw.githubusercontent.com/SpiffingIO/ubuntu-scripts/refs/heads/main/install.sh -O install.sh
```

Set the script to executable:

```
chmod +x ./install.sh
```

Run the script (it might request your `sudo` password to install some dependencies):

```
./install.sh
```

### Post Installation

Post installation, you are required to configure the following:

- **GitHub Personal Access Token**: This can be found in your GitHub profile under Developer Options.
- **Google Cloud CLI**: Run `gloud init`.
- **Slack**: [Install Slack through the Snap Store](https://slack.com/downloads/linux)

#### Other Recommendations

- In Google Chrome, update the following flags to support hardware acceleration in Wayland and window scaling. Navigate to `chrome://flags`
  - `#ozone-platform-hint=Wayland`
  - `#wayland-per-window-scaling=Enabled`
  - `#wayland-ui-scaling=Enabled`

- Recommended Gnome Extensions:
  - Bluetooth Quick Connect
  - GSConnect
  - Auto Power Profile
  - Caffeine

### Logging

Logs are saved in `/tmp/install-log.txt`
