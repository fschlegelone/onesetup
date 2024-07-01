#!/usr/bin/env zsh

# -- HOMEBREW -- #

# brew options
export CFG_BREW="$XDG_CONFIG_HOME/homebrew"
export HOMEBREW_ENV="$XDG_CONFIG_HOME/homebrew/brew.env"
export HOMEBREW_API_AUTO_UPDATE_SECS=86400
export HOMEBREW_NO_AUTOREMOVE=0
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=1
export HOMEBREW_CASK_OPTS="--fontdir"
export HOMEBREW_DISPLAY=1
export HOMEBREW_NO_ENV_HINTS=1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

# -- PNPM -- #
export PNPM_HOME="$XDG_CONFIG_HOME/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# -- AZURE-CLI -- #
# -- NODE -- #
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;; # set pnpm home
esac


# zsh-autocomplete
source "$(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# -- FZF -- # 
eval "$(fzf --zsh)"

# -- ZOXIDE -- #
eval "$(zoxide init --cmd cd --hook pwd zsh)"

# -- STARSHIP -- #
eval "$(starship init zsh)"

# -- PYENV -- #
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# -- PYENV-VIRTUALENV -- #
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi
