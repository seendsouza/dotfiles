## CONFIGS
#
## GLOBAL CONFIGS
#DEV_MODE=true
#HOBBY_MODE=true
#OS=linux
#ARCH=amd64
#DISTRO=ELEMENTARY
#CODENAME=bionic
#
## APPLICATION SPECIFIC CONFIGS
#PYTHON2_VERSION=2.7.14
#PYTHON3_VERSION=3.7.7
#GO_VERSION=1.14.6
#NVM_VERSION=0.35.3
#
## Bootstrap
#sudo apt-get update
#
#sudo ubuntu-drivers autoinstall
#sudo apt-get install -y ubuntu-restricted-extras libavcodec-extra libdvd-pkg
#sudo apt-get install -y gdebi
#sudo apt-get install -y tlp tlp-rdw
#sudo apt-get install -y docker.io
#sudo apt-get install -y software-properties-common
#sudo apt-get install -y build-essential libssl-dev libffi-dev
#sudo apt-get install -y unzip
#
## Install essential CLI programs
#sudo apt-get install -y git tmux neofetch kitty vim
#
## Install Rust
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#source $HOME/.cargo/env
#
## Install Go
#curl -O https://storage.googleapis.com/golang/go$GO_VERSION.$OS-$ARCH.tar.gz
#tar -xvf /usr/local -xzf go$GO_VERSION.$OS-$ARCH.tar.gz
#sudo chown -R root:root ./go
#sudo mv go /usr/local
#echo 'export GOPATH=$HOME/go' >> ~/.profile
#echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.profile
#source ~/.profile
#
## Install JS + TS
#curl https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash
#source ~/.profile
#nvm install stable
#nvm use stable
#npm install -g source-map support
#npm install -g typescript
#
## Install Java
#sudo apt-get install default-jre
#sudo apt-get install default-jdk
#
## Install Python + pyenv + virtualenv
#curl https://pyenv.run | bash
#echo 'export PATH="/home/seen/.pyenv/bin:$PATH"' >> ~/.profile
#echo 'eval "$(pyenv init -)"' >> ~/.profile
#source ~/.profile
#
#git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
#echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.profile
#source ~/.profile
#
#pyenv install $PYTHON3_VERSION
#pyenv install $PYTHON2_VERSION
#pyenv global $PYTHON3_VERSION
#
## Install NeoVim
#pyenv virtualenv $PYTHON3_VERSION py3nvim
#pyenv activate py3nvim
#pip install pynvim
#pyenv deactivate
#pyenv virtualenv $PYTHON2_VERSION py2nvim
#pyenv activate py2nvim
#pip install pynvim
#pyenv deactivate
#
#sudo apt-get install -y neovim
#npm install -g neovim
#
## Install vim-plug
#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#
## Install formatters
#pip install --user --upgrade autopep8
#npm i -g prettier
#
#
#if [ "$DEV_MODE" == "true" ]
#then
#  sudo apt-get install -y chromium-browser
#  sudo apt-get install -y flatpak
#
#  # Install Insomnia
#  echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
#    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
#  wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
#    | sudo apt-key add -
#  sudo apt-get update
#  sudo apt-get install insomnia
#  
#  # Install LibreOffice
#  sudo add-apt-repository ppa:philip.scott/elementary-tweaks && sudo apt-get update
#  sudo apt-get install -y libreoffice libreoffice-gtk3
#  
#  # Elementary OS specific packages
#  if [ "$DISTRO" == "ELEMENTARY" ]
#  then
#    sudo apt-get install -y elementary-tweaks libreoffice-style-elementary
#  fi
#  
#  # Install Hasklig
#  curl -LO https://github.com/i-tu/Hasklig/releases/download/1.1/Hasklig-1.1.zip
#  mkdir ~/.fonts
#  unzip Hasklig-1.1.zip -d ~/.fonts
#fi

# Install dotfiles
sudo apt-get install -y stow
cd ~/
git clone https://github.com/seendsouza/dotfiles.git
cd dotfiles
CONFIGS=( "bin" "gitconfig" "htop" "kitty" "nvim" )
for f in "${CONFIGS[@]}"
do
  if [[ -d ${f} ]]; then
    stow "$f"
    echo "$f"
  fi
done
cd ..
#
## Install ROS
#sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
#sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
#sudo apt-get update
#if [ "$DEV_MODE" == "true" ]
#then
#  sudo apt-get install -y ros-melodic-desktop-full
#else
#  sudo apt-get install -y ros-melodic-ros-base
#fi
#echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
#source ~/.bashrc
#



# Manual Steps
# 
# Install graphics drivers if applicable
# 
# Install flameshot if wanted
# 
