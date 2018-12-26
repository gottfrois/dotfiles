# Dotfiles

Heavily inspired by https://github.com/webpro/dotfiles/

## Install

On a sparkling fresh installation of macOS:

```sh
sudo softwareupdate -i -a
xcode-select --install
```

The Xcode Command Line Tools includes git and make (not available on stock macOS).
Then, install this repo with curl available:

```sh
bash -c "`curl -fsSL https://raw.githubusercontent.com/gottfrois/dotfiles/master/remote-install.sh`"
```

This will clone (using git), or download (using curl or wget), this repo to ~/.dotfiles.

Use the Makefile to install everything else and symlink `runcom` and `config`:

```sh
cd ~/.dotfiles
make
```

## Post Install

```sh
cd ~/.dotfiles
./bin/dotfiles dock
./bin/dotfiles macos
```

### The `dotfiles` command

```sh
./bin/dotfiles help
Usage: dotfiles <command>

Commands:
   clean            Clean up caches (brew, nvm, gem)
   dock             Apply macOS Dock settings
   edit             Open dotfiles in IDE () and Git GUI ()
   help             This help message
   macos            Apply macOS system defaults
   update           Update packages and pkg managers (OS, brew, npm, gem)
```
