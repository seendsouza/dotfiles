#!/bin/bash
# MacOS Install

cd ~

# Install xcode and developer stuff
xcode-select --install

# Install homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
#     eval "$(/opt/homebrew/bin/brew shellenv)"

# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

brew update

# brew install git
brew install neovim
brew install tmux
brew install neofetch
brew install htop
brew install ripgrep
brew install fd
brew install jq
brew install nvm
brew install sqlite
brew install zstd
brew install cmake
brew install awscli
brew install freetype
brew install gcc
brew install curl
brew instsall kubernetes-cli
brew install k9s
brew install tree
brew install fzf
brew install ruff

brew install --cask insomnia
brew install --cask kitty
brew install --cask visual-studio-code
brew install --cask dbeaver
brew install --cask iina
brew install --cask stats
brew install --cask the-unarchiver
brew install --cask raycast


git config --global user.email "0xseen64@gmail.com"
git config --global user.name "Sean D'Souza"

: '
Manual steps

Install:
- Arc

Settings:
- Copy kitty, neovim configs manually
- Under "Desktop & Dock" check "Minimize window into application icon"
- Under "Desktop & Dock" uncheck "Show suggested and recent apps in Dock"
- Under "Keyboard" > "Text Input" > <your keyboard> > uncheck "Correct spelling automatically"
- Under "Keyboard" > "Text Input" > <your keyboard> > uncheck "Capitalize words automatically"
- Under "Keyboard" > "Text Input" > <your keyboard> > uncheck "Add period with double-space"
- Under "General" > "Date & Time" > check "24-hour time"
- Under "General" > "Date & Time" > check "Show 24-hour time on Lock Screen"

Finder:
- Add folder Screenshots to Macintosh HD > Users > sean > Pictures
- Add to Favorites:
  - Macintosh HD > Users > sean
  - Macintosh HD > Users > sean > Pictures
  - Macintosh HD > Users > sean > Pictures > Screenshots
  - Macintosh HD > Users > sean > Downloads

Screenshots:
1. Cmd + Shift + 5
2. Options > Save to > Other location > Screenshots folder location
'
