#!/usr/bin/env zsh

# -- SYSTEM VARIABLES -- #
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"
export HOSTNAME="mac-one"

# -- LINUX VARIABLES -- #
export USR="$USER"

# -- XDG VARIABLES -- #
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# -- CUSTOM DIRECTORY VARIABLES -- #
export NAS="$HOME/nas"
export DEV="/opt/dev"
export GH="$HOME/github"
export NOTES="$NAS/notes"

export APPSUP="$HOME/Library/Application Support"
export ZSH_DIR="$XDG_CONFIG_HOME/zsh"
export ZDOTDIR="$HOME"

# -- NEOVIM -- # 
export NVIMPAGER_NVIM="/opt/homebrew/bin/nvim"
export PAGER="nvimpager"

# -- COMPILER (C) -- #
export LDFLAGS="-L/opt/homebrew/opt/binutils/lib" # binutils
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib" # llvm / clang
export CPPFLAGS="-I/opt/homebrew/opt/binutils/include" # binutils
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include:$CPPFLAGS" # llvm / clang

# DOTNET
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# STARSHIP
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# NODE / PNPM / YARN_PNP
export PNPM_HOME="$XDG_CONFIG_HOME/pnpm"

# PYTHON / PYENV / PIP / VIRTUAL ENV / POETRY
export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"
export PYENV_VERSION="3.12.4"

# GPG / GNUPG
export GNUPGHOME="$CRIT_DIR/gnupg" # gnupg config directory
export GPG_TTY=$(tty) # fixes inappropriate ioctl for device error

# DOCKER / PODMAN
export DOCKER_HOST='unix:///var/folders/t8/nh9c_yvx5qjb_4xrv8gzlthc0000gn/T/podman/podman-machine-default-api.sock'
