# Obsidian Vault Backup Tool

A simple shell function to automate Obsidian vault backups to ProtonDrive using rclone.

![Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![Fish](https://img.shields.io/badge/Shell-Fish-4EAA25?logo=gnu-bash&logoColor=white)
![Zsh](https://img.shields.io/badge/Shell-Zsh-4EAA25?logo=gnu-bash&logoColor=white)
![rclone](https://img.shields.io/badge/Uses-rclone-blue)
![License](https://img.shields.io/github/license/linuxmunchies/obsidian-vault-backup)

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

## Customization
You can customize the following variables in the function:

Change the vault location by modifying ${HOME}/Documents/Obsidian
Change the backup name prefix by modifying FoxVault_ in the zipfile variable
Change the destination by modifying ProtonDrive:Archives/Obsidian/

## Troubleshooting

rclone not found: Install rclone with sudo dnf install rclone (Fedora) or appropriate package manager
ProtonDrive remote not configured: Set up the remote with rclone config
Permissions issues: Ensure you have read access to your Obsidian vault and write access to /tmp
Network issues: Check your internet connection and ProtonDrive access

# License
MIT
