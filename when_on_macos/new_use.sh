#!/usr/bin/env sh

brew install
brew install texstudio
brew install mactex --cask
brew install wget
brew install iterm2 --cask
brew install todesk --cask
# brew install cinebench --cask
# brew install inkscape --cask # for svg view


# Upgrade Homebrew and the information about formulas
brew update
# List the outdated casks (optional)
brew cask outdated
# Upgrade all outdated casks
brew cask upgrade