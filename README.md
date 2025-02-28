# Obsidian Vault Backup Tool

A simple shell function to automate Obsidian vault backups to ProtonDrive using rclone.

![Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![Fish](https://img.shields.io/badge/Shell-Fish-4EAA25?logo=gnu-bash&logoColor=white)
![Zsh](https://img.shields.io/badge/Shell-Zsh-4EAA25?logo=gnu-bash&logoColor=white)
![rclone](https://img.shields.io/badge/Uses-rclone-blue)
![License](https://img.shields.io/github/license/yourusername/obsidian-vault-backup)

## Features

- Creates timestamped ZIP archives of your Obsidian vault
- Uploads archives to ProtonDrive via rclone
- Works with Bash, Zsh, and Fish shells
- Includes error checking and verification
- No additional dependencies besides rclone and zip

## Installation

1. Set up rclone with ProtonDrive
2. Add the function to your shell configuration

Detailed instructions in the [documentation](docs/README.md).

## Quick Start

```bash
# Add this function to your shell configuration file
# (.bashrc, .zshrc, or config.fish)

# For Bash/Zsh:
fvault_backup() {
  # Function code here...
}

# Then run:
fvault_backup

# License
MIT
