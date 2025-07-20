#!/bin/bash

set -euo pipefail

TOTAL_STEPS=23
current_step=0
LOG="/tmp/install-log.txt"
touch "$LOG"
SUMMARY=""

run_step() {
  local message=$1
  local command=$2

  current_step=$((current_step + 1))
  printf "[%2d/%2d] %s... " "$current_step" "$TOTAL_STEPS" "$message"

  if eval "$command" >> "$LOG" 2>&1; then
    echo "✅"
    SUMMARY+="$current_step. $message ✓\n"
  else
    echo "❌"
    SUMMARY+="$current_step. $message ❌ (see $LOG)\n"
  fi
}

echo "▶ Starting development environment setup..."
echo "Log file: $LOG"
echo "--------------------------------------------"

run_step "Updating system packages" "sudo apt-get update -y"
run_step "Upgrading existing packages" "sudo apt-get upgrade -y"

run_step "Installing APT packages" "sudo apt-get install -y \
  pavucontrol libfuse2 libinput-tools ruby xdotool python3-pip \
  curl git flatpak kdeconnect gnome-sushi gnome-shell-extension-manager \
  docker.io v4l-utils vlc graphviz pdftk gnome-tweaks \
  python3 python3-venv python-is-python3 ffmpeg virt-manager gimp"

run_step "Installing GitHub CLI" "
  GH_DEB=\$(mktemp)
  wget -O \"\$GH_DEB\" https://github.com/cli/cli/releases/download/v2.45.0/gh_2.45.0_linux_amd64.deb
  sudo dpkg -i \"\$GH_DEB\" || sudo apt-get install -f -y
  rm \"\$GH_DEB\"
"

run_step "Configuring Flatpak" "flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"

run_step "Installing Google Cloud SDK" "
  curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
  tar -xf google-cloud-cli-linux-x86_64.tar.gz
  ./google-cloud-sdk/install.sh --usage-reporting false --command-completion true --quiet
"

run_step "Installing AWS CLI" "
  curl 'https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip' -o 'awscliv2.zip'
  unzip awscliv2.zip
  sudo ./aws/install
  rm -rf awscliv2.zip aws/
"

run_step "Installing AWS EB CLI" "
  python3 -m venv /opt/eb-venv
  sudo chmod -R a+rx /opt/eb-venv
  source /opt/eb-venv/bin/activate
  pip3 install awsebcli
  deactivate
"

run_step "Installing fonttools in venv" "
  sudo python3 -m venv /opt/fonttools-venv
  sudo chmod -R a+rx /opt/fonttools-venv
  source /opt/fonttools-venv/bin/activate
  pip3 install fonttools
  deactivate
"

run_step "Installing brotli in venv" "
  sudo python3 -m venv /opt/brotli-venv
  sudo chmod -R a+rx /opt/brotli-venv
  source /opt/brotli-venv/bin/activate
  pip3 install brotli
  deactivate
"

run_step "Installing zopfli in venv" "
  sudo python3 -m venv /opt/zopfli-venv
  sudo chmod -R a+rx /opt/zopfli-venv
  source /opt/zopfli-venv/bin/activate
  pip3 install zopfli
  deactivate
"

run_step "Installing sslyze in venv" "
  sudo python3 -m venv /opt/sslyze-venv
  sudo chmod -R a+rx /opt/sslyze-venv
  source /opt/sslyze-venv/bin/activate
  pip3 install sslyze
  deactivate
"

run_step "Installing NVM" "
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  export NVM_DIR=\"\$HOME/.nvm\"
  [ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"
  nvm install --lts
  nvm install 24
"

run_step "Installing Glyphhanger via npm" "
  sudo npm install -g glyphhanger
"

run_step "Installing Google Chrome" "
  CHROME_DEB=\$(mktemp)
  wget -O \"\$CHROME_DEB\" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i \"\$CHROME_DEB\" || sudo apt-get install -f -y
  rm \"\$CHROME_DEB\"
"

run_step "Installing Obsidian" "
  OBSIDIAN_DEB=\$(mktemp)
  wget -O \"\$OBSIDIAN_DEB\" https://github.com/obsidianmd/obsidian-releases/releases/download/v1.8.10/obsidian_1.8.10_amd64.deb
  sudo dpkg -i \"\$OBSIDIAN_DEB\" || sudo apt-get install -f -y
  rm \"\$OBSIDIAN_DEB\"
"

run_step "Installing ImageMagick AppImage" "
  sudo mkdir -p /opt/AppImages
  sudo chmod -R a+rx /opt/AppImages
  wget -O /opt/AppImages/imagemagick.AppImage https://github.com/ImageMagick/ImageMagick/releases/download/7.1.1-28/ImageMagick-7.1.1-28.AppImage
  chmod +x /opt/AppImages/imagemagick.AppImage
"

run_step "Installing VSCode" "sudo snap install code --classic"

run_step "Enable UFW" "sudo ufw enable"

run_step "Enable IPv4 forwarding" "sudo sysctl -w net.ipv4.ip_forward=1"

run_step "Final APT fix & cleanup" "sudo apt-get install -f -y"
run_step "Cleaning up package cache" "sudo apt-get autoremove -y"

# Summary
echo -e "\n✅ Setup Complete! Summary:\n"
echo -e "$SUMMARY"
echo "Full output log saved at: $LOG"
