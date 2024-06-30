#!/usr/bin/env bash

TEXTCOLOR="\033[1;34m"

# Update homebrew
printf "${TEXTCOLOR}Updating Homebrew...\n"
brew update

# Update formulaes and casks
printf "${TEXTCOLOR}Upgrading homebrew formulaes and casks...\n"

# Cleanup cache of unfinished downloads
printf "${TEXTCOLOR}Cleaning up homebrew cache...\n"
brew cleanup

# Show problems if any
printf "${TEXTCOLOR}Checking for homebrew issues...\n"
brew doctor
