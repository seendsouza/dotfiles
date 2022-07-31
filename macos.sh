#!/bin/bash
# MacOS Install

cd ~

# Install xcode and developer stuff
xcode-select --install

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew update

# brew install git
brew install neovim
brew install tmux
brew install neofetch
brew install htop
brew install ripgrep
brew install fd
# brew cask install google-chrome
# brew cask install docker
brew install --cask insomnia
brew install --cask kitty

git config --global user.email "0xseen64.com"
git config --global user.name "Sean D'Souza"

# Languages
# curl -s "https://get.sdkman.io" | bash
# sdk install java 14.0.1-open
# brew install clojure/tools/clojure

brew install nvm
nvm install stable
nvm use stable
# npm install -g source-map support

# sudo mkdir /Applications/clojure
# sudo curl -O https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
# sudo chmod +x lein
cd ~

# brew install pyenv
# # TODO: pyenv virtualenv install
# pyenv install 3.7.7
# pyenv global 3.7.7
# pyenv virtualenv 3.7.7 py3nvim
# pyenv activate py3nvim
# pip install py3nvim
# pyenv deactivate
# pyenv install 2.7.14
# pyenv global 2.7.14
# pyenv virtualenv 2.7.14 py3nvim
# pyenv activate py3nvim
# pip install py3nvim
# gem install neovim
# npm i -g neovim
# pyenv deactivate
# brew install ruby
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# pip install --user --upgrade autopep8
npm i -g prettier
# TODO: update google_java_executable with the one in the path
# TODO: put zprint on path and change zprint_executable

#echo export PATH="$PATH:/Applications/clojure:/usr/local/opt/ruby/bin” >> .bash_profile

:'
Copy kitty, bashrc, neovim configs manually
'

:'
MANUAL STEPS

Install Hasklig

System Preferences > Trackpad > Scroll & Zoom
Uncheck scroll direction

System Preferences > Date and Time
Check Display time with seconds
Check Use 24 hour clock
Check Show date

Dock:
Size to small
Turn on magnification
Remove icons

Change Avatar

Finder:
Macintosh HD to locations
Home /Users/edsosea
screenshots /Users/edsosea/Pictures/screenshots

'

:'
yabai:
Mission Control -> System Preferences "Display have separate spaces" enabled
"Automatically rearrange Spaces based on most recent use" disabled

Disable System Integrity Protection
Install yabai
Confiugre yabai
Install skhd
Configure with skhd
'
