# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Name of the theme to load (see ~/.oh-my-zsh/themes/).
ZSH_THEME="robbyrussell"

# Command execution time stamp format in the history command output.
HIST_STAMPS="dd/mm/yyyy"

# Custom folder in place of $ZSH/custom.
ZSH_CUSTOM=$DOTFILES/custom

# Plugins to load (see ~/.oh-my-zsh/plugins/).
plugins=(git kubectl)

source $ZSH/oh-my-zsh.sh

# Language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Fixes "[__NSCFConstantString initialize] may have been in progress in another thread when fork() was called"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Load custom commands
export PATH="$DOTFILES/bin:$PATH"

# Enables Elixir IEX history
export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"

export PATH=$PATH:$HOME/.maestro/bin

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Local binaries (also used by the cua-driver-rs installer)
export PATH="$HOME/.local/bin:$PATH"

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# asdf shims first, so that .tool-versions selects the tool versions.
export PATH="$HOME/.asdf/shims:$PATH"
