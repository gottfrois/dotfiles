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
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating brew recipes..."
brew update

brew tap homebrew/bundle
echo "Installing brew recipes from $DOTFILES/install/Brewfile"
brew bundle --file=$DOTFILES/install/Brewfile
echo "Installing brew recipes from $DOTFILES/install/Caskfile"
brew bundle --file=$DOTFILES/install/Caskfile

echo "Making ZSH the default shell environment..."
chsh -s $(which zsh)

echo "Creating Code directory..."
mkdir -p $HOME/Code

# Copy & Link files in config
for FILE in $(ls -A $DOTFILES/config)
do
  echo "Replacing $HOME/$FILE to $DOTFILES/$FILE..."
  rm -rf $HOME/$FILE
  ln -s $DOTFILES/config/$FILE $HOME/$FILE
done

if ! [ -d $HOME/.nvm/.git ]
then
  echo "Installing NPM..."
  git clone https://github.com/creationix/nvm.git $HOME/.nvm
  . $HOME/.nvm/nvm.sh; nvm install --lts
  echo "Installing Node packages..."
  . $HOME/.nvm/nvm.sh; npm install -g $(cat $DOTFILES/install/Npmfile)
fi

if ! [ -f $HOME/.rvm/VERSION ]
then
  echo "Installing RVM..."
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  curl -sSL https://get.rvm.io | bash -s stable --ruby
  echo "Installing Ruby gems..."
  gem install $(cat $DOTFILES/install/Gemfile)
fi

if ! [ -d $HOME/.atom/packages ]
then
  echo "Installing Atom packages..."
  apm install --packages-file $DOTFILES/install/Atomfile
fi

echo "Creating symlink $HOME/.mackup.cfg => $DOTFILES/config/.mackup.cfg"
ln -s $DOTFILES/config/.mackup.cfg $HOME/.mackup.cfg

# Set macOS & other apps defaults
# We run this last because this will reload the shell
dotfiles macos
dotfiles dock

# Clean up caches
dotfiles clean
