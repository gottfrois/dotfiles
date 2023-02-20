#!/usr/bin/env bash

SOURCE="https://github.com/gottfrois/dotfiles"
TARBALL="$SOURCE/tarball/master"
DOTFILES="$HOME/.dotfiles"
TAR_CMD="tar -xzv -C "$DOTFILES" --strip-components=1 --exclude='{.gitignore}'"

is_executable() {
  type "$1" > /dev/null 2>&1
}

if is_executable "git"; then
  CMD="git clone $SOURCE $DOTFILES"
elif is_executable "curl"; then
  CMD="curl -#L $TARBALL | $TAR_CMD"
elif is_executable "wget"; then
  CMD="wget --no-check-certificate -O - $TARBALL | $TAR_CMD"
fi

if [ -z "$CMD" ]; then
  echo "No git, curl or wget available. Aborting."
  exit 1
fi

echo "Setting up your Mac..."
mkdir -p "$DOTFILES"
eval "$CMD"

echo "This scripts needs to install things with root permissions"
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Installing brew..."
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if is_executable "brew"; then
  echo "Updating brew recipes..."
  brew update

  brew tap homebrew/bundle
  echo "Installing brew recipes from $DOTFILES/install/Brewfile"
  brew bundle --file=$DOTFILES/install/Brewfile
  echo "Installing brew recipes from $DOTFILES/install/Caskfile"
  brew bundle --file=$DOTFILES/install/Caskfile
fi

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Creating Code directory..."
mkdir -p $HOME/Code

# Copy & Link files in config
for FILE in $(ls -A $DOTFILES/config)
do
  echo "Replacing $HOME/$FILE to $DOTFILES/$FILE..."
  rm -rf $HOME/$FILE
  ln -s $DOTFILES/config/$FILE $HOME/$FILE
done

echo "Reloading shell..."
source ~/.zshrc

# TODO replace with VSCode
# if ! [ -d $HOME/.atom/packages ]
# then
#   echo "Installing Atom packages..."
#   apm install --packages-file $DOTFILES/install/Atomfile
# fi

if is_executable "asdf"; then
  echo "Adding asdf plugins..."
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
  asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
fi

if is_executable "npm"; then
  echo "Installing NPM packages..."
  npm install -g $(cat $DOTFILES/install/Npmfile)
fi

echo "Creating symlink $HOME/.mackup.cfg => $DOTFILES/config/.mackup.cfg"
ln -s $DOTFILES/config/.mackup.cfg $HOME/.mackup.cfg

echo "Done!"
echo "You may now run dotfiles dock"
echo "You may now run dotfiles macos"
