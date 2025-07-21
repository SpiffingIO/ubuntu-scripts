# Ubuntu Scripts

This repository includes a collection of scripts required to set up an Ubuntu workstation.

## Description

This section provides a brief description and access method for each tool installed by the provided setup script.

### System Utilities & Development Tools

* **`pavucontrol`**
    * **Use:** A graphical volume control for PulseAudio, allowing fine-tuned control over audio devices and streams.
    * **Access:** Launch from the applications menu or by typing `pavucontrol` in the terminal.

* **`libfuse2`**
    * **Use:** A library that allows users to create their own file systems in userspace. Often a dependency for various applications.
    * **Access:** This is a library and is not directly accessed by users; it's utilized by applications that depend on it.

* **`libinput-tools`**
    * **Use:** Tools for debugging and analyzing input devices (keyboards, mice, touchpads) using the libinput library.
    * **Access:** Use commands like `libinput debug-events` or `libinput list-devices` in the terminal.

* **`ruby`**
    * **Use:** An open-source programming language with a focus on simplicity and productivity, often used for web development (Ruby on Rails) and scripting.
    * **Access:** Run Ruby scripts with `ruby <script_name.rb>` or enter the interactive Ruby shell with `irb` in the terminal.

* **`xdotool`**
    * **Use:** A command-line tool that simulates keyboard input and mouse activity, and allows window manipulation. Useful for scripting automated tasks.
    * **Access:** Use commands like `xdotool key "alt+Tab"` or `xdotool mousemove 100 100` in the terminal.

* **`python3-pip`**
    * **Use:** The package installer for Python, used to install and manage Python packages from PyPI (Python Package Index).
    * **Access:** Use `pip3 install <package_name>` in the terminal.

* **`curl`**
    * **Use:** A command-line tool for transferring data with URLs, supporting various protocols (HTTP, HTTPS, FTP, etc.). Commonly used for downloading files or making API requests.
    * **Access:** Use `curl <URL>` in the terminal.

* **`git`**
    * **Use:** A distributed version control system for tracking changes in source code during software development, facilitating collaboration among developers.
    * **Access:** Use `git init`, `git clone`, `git add`, `git commit`, `git push`, etc., in the terminal.

* **`flatpak`**
    * **Use:** A universal software packaging and distribution system, allowing applications to be run in sandboxed environments, independent of the host system.
    * **Access:** Use `flatpak install <application>`, `flatpak run <application>`, etc., in the terminal.

* **`kdeconnect`**
    * **Use:** Integrates your Android device with your desktop, enabling features like shared notifications, file sharing, remote control, and clipboard synchronization.
    * **Access:** Launch from the applications menu or by typing `kdeconnect-app` in the terminal.

* **`gnome-sushi`**
    * **Use:** A quick previewer for Nautilus (GNOME Files) that allows you to preview files by pressing the spacebar, similar to macOS Quick Look.
    * **Access:** Navigate to a file in GNOME Files and press the Spacebar.

* **`gnome-shell-extension-manager`**
    * **Use:** A utility to discover, install, and manage GNOME Shell extensions, which extend the functionality and appearance of the GNOME desktop.
    * **Access:** Launch from the applications menu or by typing `gnome-shell-extension-manager` in the terminal.

* **`docker.io`**
    * **Use:** A platform for developing, shipping, and running applications in containers, providing isolation and portability.
    * **Access:** Use `sudo docker run <image>`, `sudo docker build`, `sudo docker ps`, etc., in the terminal.

* **`v4l-utils`**
    * **Use:** Utilities for working with Video4Linux devices, primarily webcams and TV tuners, allowing configuration and testing.
    * **Access:** Use commands like `v4l2-ctl` in the terminal.

* **`vlc`**
    * **Use:** A free and open-source, portable, cross-platform media player and streaming media server that plays most multimedia files, as well as DVDs, Audio CDs, VCDs, and various streaming protocols.
    * **Access:** Launch from the applications menu or by typing `vlc` in the terminal. 

* **`graphviz`**
    * **Use:** Open-source graph visualization software that takes descriptions of graphs in a simple text language and produces diagrams.
    * **Access:** Use commands like `dot` (part of Graphviz) to render graph files: `dot -Tpng input.dot -o output.png` in the terminal.

* **`pdftk`**
    * **Use:** A command-line tool for manipulating PDF documents, such as merging, splitting, rotating, encrypting, and decrypting PDFs.
    * **Access:** Use `pdftk input.pdf cat 1-5 output output.pdf` or other `pdftk` commands in the terminal.

* **`gnome-tweaks`**
    * **Use:** A utility to customize various aspects of the GNOME desktop environment that are not available in the standard system settings.
    * **Access:** Launch from the applications menu or by typing `gnome-tweaks` in the terminal.

* **`python3`**
    * **Use:** A widely used general-purpose programming language, often used for web development, data analysis, artificial intelligence, and automation.
    * **Access:** Run Python scripts with `python3 <script_name.py>` or enter the interactive interpreter with `python3` in the terminal.

* **`python3-venv`**
    * **Use:** A module that allows the creation of lightweight "virtual environments" for Python projects, isolating their dependencies.
    * **Access:** Use `python3 -m venv <directory_name>` to create a virtual environment in the terminal.

* **`python-is-python3`**
    * **Use:** A package that provides a symlink so that `python` points to `python3`, ensuring compatibility with scripts expecting the `python` command.
    * **Access:** After installation, typing `python` in the terminal will execute `python3`.

* **`ffmpeg`**
    * **Use:** A complete, cross-platform solution to record, convert, and stream audio and video. It includes a vast suite of libraries and programs.
    * **Access:** Use commands like `ffmpeg -i input.mp4 output.mp3` for conversions in the terminal.

* **`virt-manager`**
    * **Use:** A graphical user interface for managing virtual machines via Libvirt, supporting KVM, Xen, and LXC.
    * **Access:** Launch from the applications menu or by typing `virt-manager` in the terminal.

* **`gimp`**
    * **Use:** The GNU Image Manipulation Program, a free and open-source raster graphics editor used for image retouching, image composition, and image authoring.
    * **Access:** Launch from the applications menu or by typing `gimp` in the terminal.

### CLI Tools & Cloud SDKs

* **GitHub CLI (`gh`)**
    * **Use:** A command-line tool that brings GitHub to your terminal, allowing you to manage repositories, issues, pull requests, and more directly from the command line.
    * **Access:** Use `gh repo clone <repo>`, `gh issue list`, `gh pr checkout <pr_number>`, etc., in the terminal.

* **Google Cloud SDK (`gcloud`)**
    * **Use:** A set of tools for Google Cloud, enabling you to manage resources and applications on Google Cloud Platform from the command line.
    * **Access:** Use `gcloud auth login`, `gcloud compute instances list`, `gcloud app deploy`, etc., in the terminal.

* **AWS CLI (`aws`)**
    * **Use:** The official command-line interface for Amazon Web Services, allowing you to control AWS services from the terminal.
    * **Access:** Use `aws s3 ls`, `aws ec2 describe-instances`, `aws configure`, etc., in the terminal.

* **AWS EB CLI (`eb`)**
    * **Use:** The command-line interface for AWS Elastic Beanstalk, used to deploy and manage applications on Elastic Beanstalk from the terminal.
    * **Access:** **Requires activation of its virtual environment:** First, run `source /opt/eb-venv/bin/activate`, then use `eb init`, `eb deploy`, etc. To exit the environment, type `deactivate`.

### Python Virtual Environment Tools

These tools are installed within isolated Python virtual environments for dependency management. To use them, you must first activate their respective environments.

* **`fonttools`**
    * **Use:** A library to manipulate fonts, useful for font subsetting, conversion, and inspection.
    * **Access:** **Requires activation of its virtual environment:** First, run `source /opt/fonttools-venv/bin/activate`, then use commands like `pyftsubset`, `ttfautohint`, etc. To exit the environment, type `deactivate`.

* **`brotli`**
    * **Use:** A generic-purpose lossless compression algorithm developed by Google, often used for web content compression.
    * **Access:** **Requires activation of its virtual environment:** First, run `source /opt/brotli-venv/bin/activate`, then use `brotli` commands. To exit the environment, type `deactivate`.

* **`zopfli`**
    * **Use:** A compression algorithm by Google that aims for better compression density than zlib/deflate, often used for web assets.
    * **Access:** **Requires activation of its virtual environment:** First, run `source /opt/zopfli-venv/bin/activate`, then use `zopfli` commands. To exit the environment, type `deactivate`.

* **`sslyze`**
    * **Use:** A Python tool for analyzing the SSL/TLS configuration of a server by connecting to it.
    * **Access:** **Requires activation of its virtual environment:** First, run `source /opt/sslyze-venv/bin/activate`, then use `sslyze --regular www.example.com`. To exit the environment, type `deactivate`.

### Node.js & npm Tools

* **Node Version Manager (`nvm`)**
    * **Use:** A command-line utility for managing multiple active Node.js versions on a single machine.
    * **Access:** After opening a new terminal or sourcing your shell profile, use `nvm install <version>`, `nvm use <version>`, `nvm ls`, etc.

* **`glyphhanger`**
    * **Use:** A command-line tool for font subsetting and glyph removal, particularly useful for web performance optimization.
    * **Access:** After `nvm` is set up and Node.js is active (or by sourcing your shell's profile), use `glyphhanger --text "Hello world" --output "subset.woff"` in the terminal.

### Applications

* **Google Chrome**
    * **Use:** A popular web browser developed by Google, known for its speed, security, and extensive ecosystem of extensions.
    * **Access:** Launch from the applications menu or by typing `google-chrome` in the terminal. 

* **Obsidian**
    * **Use:** A powerful knowledge base that works on local Markdown files, providing a non-linear way to organize and connect notes.
    * **Access:** Launch from the applications menu or by typing `obsidian` in the terminal. 

* **ImageMagick (`magick`)**
    * **Use:** A software suite to create, edit, compose, or convert bitmap images. It can read and write images in a variety of formats.
    * **Access:** Use commands like `magick convert input.png output.jpg` or `magick identify image.png` in the terminal.

* **Visual Studio Code (`code`)**
    * **Use:** A popular free source-code editor developed by Microsoft, offering support for debugging, embedded Git control, syntax highlighting, intelligent code completion, snippets, and code refactoring.
    * **Access:** Launch from the applications menu or by typing `code` in the terminal. 

### Networking & Security

* **Uncomplicated Firewall (`ufw`)**
    * **Use:** A user-friendly front-end for `iptables`, simplifying firewall configuration to manage network connections.
    * **Access:** Use `sudo ufw status`, `sudo ufw allow <port>`, `sudo ufw deny <port>`, etc., in the terminal.


## Installation & Usage

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


## Post Installation

Post installation, you are required to configure the following:

- **GitHub SSH**: This can be found in your _GitHub Settings_ under _SSH and GPG keys_. [Read more](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).
- **Google Cloud CLI**: Run `gloud init`.
- **Slack**: [Install Slack through the Snap Store](https://slack.com/downloads/linux)


### Other Recommendations

- In Google Chrome, update the following flags to support hardware acceleration in Wayland and window scaling. Navigate to `chrome://flags`
  - `#ozone-platform-hint=Wayland`
  - `#wayland-per-window-scaling=Enabled`
  - `#wayland-ui-scaling=Enabled`

- Recommended Gnome Extensions:
  - Bluetooth Quick Connect
  - GSConnect
  - Auto Power Profile
  - Caffeine


## Logging

Logs are saved in `/tmp/install-log.txt`
