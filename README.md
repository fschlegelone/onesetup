# 1SETUP

## Prerequisites

- **Internet**: Since onesetup pulls packages from the internet, you need to ensure an active internet connection during the entire proccess.
- **Homebrew** (macOS only): I did not yet manage to automate the homebrew installation, so you need to install it manually.

## Environment Variables

    **Before running the onesetup script, you need to set the following environment variables**
    - $ONESETUP_DIR (default: "$HOME/.config/onesetup")
        specifies where the onesetup directory lives
    - $ONESETUP_SECRET
        path to a text file with the password for ansible vault

## Installation

    "bash" -c "$(curl -fsSL https://raw.githubusercontent.com/fschlegelone/onesetup/main/bin/install)"

## Roadmap

- Add support for Linux
- Automate homebrew installation for macOS
