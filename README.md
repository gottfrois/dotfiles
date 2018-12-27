# Dotfiles

This repository includes scripts and config files to help me setup and maintain
my Mac.
Feel free to explore and copy what you need, at your own risk!

## Install

On a sparkling fresh installation of macOS:

```sh
sudo softwareupdate -i -a
xcode-select --install
```

The Xcode Command Line Tools includes git and make (not available on stock macOS).
Then, install this repo with curl available:

```sh
bash -c "`curl -fsSL https://raw.githubusercontent.com/gottfrois/dotfiles/master/install.sh`"
```

This will clone (using git), or download (using curl or wget), this repo to ~/.dotfiles
and initiate installation.

Finally restore applications settings with:

```sh
dotfiles restore
```

## The `dotfiles` command

```sh
./bin/dotfiles help
Usage: dotfiles <command>

Commands:
   clean            Clean up caches (brew, nvm, gem)
   dock             Apply macOS Dock settings
   edit             Open dotfiles in IDE () and Git GUI ()
   help             This help message
   macos            Apply macOS system defaults
   restore          Restore applications settings using mackup
   update           Update packages and pkg managers (OS, brew, npm, gem)
```

## Thanks

Thanks to the following guys for their awesome work which this repo is heavily
inspired!

- https://github.com/webpro/dotfiles/
- https://github.com/driesvints/dotfiles
