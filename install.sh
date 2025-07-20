#!/bin/bash

set -euo pipefail

TOTAL_STEPS=21
CURRENT_STEP=0
LOG="/tmp/install-log.txt"
touch "$LOG"
SUMMARY=""

update_progress() {
  local step=$1
  local message=$2
  CURRENT_STEP=$((step * 100 / TOTAL_STEPS))
  echo $CURRENT_STEP
  echo "# $message"
}

run_step() {
  local step_num=$1
  local message=$2
  local command=$3

  update_progress "$step_num" "$message"
  eval "$command" >> "$LOG" 2>&1
  SUMMARY+="$step_num. $message ✓\n"
  sleep 0.3
}

{
run_step 1 "Updating system packages" "sudo apt-get update -y"
run_step 2 "Upgrading existing packages" "sudo apt-get upgrade -y"

run_step 3 "Installing APT packages" "sudo apt-get install -y \
  pavucontrol libfuse2 libinput-tools ruby xdotool python3-pip \
  curl git flatpak kdeconnect gnome-sushi gnome-shell-extension-manager \
  noisetorch docker.io v4l-utils vlc graphviz pdftk gnome-tweaks \
  python3 python3-venv ffmpeg virt-manager gimp"

run_step 4 "Installing GitHub CLI" "
  GH_DEB=\$(mktemp)
  wget -O \"\$GH_DEB\" https://github.com/cli/cli/releases/download/v2.45.0/gh_2.45.0_linux_amd64.deb
  sudo dpkg -i \"\$GH_DEB\" || sudo apt-get install -f -y
  rm \"\$GH_DEB\"
"

run_step 5 "Configuring Flatpak" "flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"

run_step 6 "Installing Google Cloud SDK" "curl -sSL https://sdk.cloud.google.com | bash"

run_step 7 "Installing MongoDB" "
  wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
  echo 'deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse' |
    sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
  sudo apt-get update
  sudo apt-get install -y mongodb-org
"

run_step 8 "Installing AWS CLI" "
  curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o 'awscliv2.zip'
  unzip awscliv2.zip
  sudo ./aws/install
  rm -rf awscliv2.zip aws/
"

run_step 9 "Installing AWS EB CLI" "
  python3.11 -m venv ~/eb-venv
  source ~/eb-venv/bin/activate
  pip install awsebcli
  deactivate
"

run_step 10 "Installing fonttools in venv" "
  python3.11 -m venv ~/fonttools-venv
  source ~/fonttools-venv/bin/activate
  pip install fonttools
  deactivate
"

run_step 11 "Installing pip tools" "pip3 install brotli zopfli sslyze"

run_step 12 "Installing Glyphhanger via npm" "
  sudo apt-get install -y nodejs npm
  sudo npm install -g glyphhanger
"

run_step 13 "Installing NVM" "
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  export NVM_DIR=\"\$HOME/.nvm\"
  [ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"
  nvm install --lts
"

run_step 14 "Setting GNOME scaling factor" "gsettings set org.gnome.desktop.interface scaling-factor 0.88 || true"

run_step 15 "Installing Google Chrome" "
  CHROME_DEB=\$(mktemp)
  wget -O \"\$CHROME_DEB\" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i \"\$CHROME_DEB\" || sudo apt-get install -f -y
  rm \"\$CHROME_DEB\"
"

run_step 16 "Installing Obsidian" "sudo snap install obsidian"

run_step 17 "Installing ImageMagick AppImage" "
  mkdir -p ~/AppImages
  wget -O ~/AppImages/imagemagick.AppImage https://github.com/ImageMagick/ImageMagick/releases/download/7.1.1-28/ImageMagick-7.1.1-28.AppImage
  chmod +x ~/AppImages/imagemagick.AppImage
"

run_step 18 "Installing VSCode" "sudo snap install code --classic"

run_step 19 "Installing Slack" "
  SLACK_DEB=\$(mktemp)
  wget -O \"\$SLACK_DEB\" https://downloads.slack-edge.com/linux_releases/slack-desktop-4.39.88-amd64.deb
  sudo dpkg -i \"\$SLACK_DEB\" || sudo apt-get install -f -y
  rm \"\$SLACK_DEB\"
"

run_step 20 "Final APT fix & cleanup" "sudo apt-get install -f -y"
run_step 21 "Cleaning up package cache" "sudo apt-get autoremove -y"
} | whiptail --gauge "Installing development environment..." 8 70 0

# Final Summary
whiptail --title "Installation Complete" --msgbox "All steps completed successfully.\n\n$SUMMARY" 20 70
