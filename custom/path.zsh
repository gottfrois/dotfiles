# Node & npm
export PATH="$PATH:$HOME/.node/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Local bin directories before anything else
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Load custom commands
export PATH="$DOTFILES/bin:$PATH"
