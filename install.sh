#!/usr/bin/env bash

BACKUP_DATE=$(date +"%Y%m%d%H%M%S")

function install-dotfile {
    FILENAME=$1
    BACKUP_DIR=~/.dotfile-backup/$BACKUP_DATE/

    # If it already exists, move the existing file into backup
    if [ -f ~/$FILENAME ]; then
        mkdir -p $BACKUP_DIR
        mv ~/$FILENAME $BACKUP_DIR/$FILENAME
    fi

    ln -sf $(pwd)/dotfiles/$FILENAME ~
}

install-dotfile .profile
install-dotfile .bashrc

# Install xcode CLI tools. Required for git, (and homebrew)
xcode-select --install

# Install homebrew if it is not already installed
if ! (command -v brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    source ~/.profile
fi

# Install the newest version of bash. By default MacOS comes with bash v3
brew install bash
brew install bash-completion@2


# Set up the mac terminal
# Add a custom profile
plutil -insert "Window Settings.MikesProfile" -xml "$(cat ./settings/profile.xml)" ~/Library/Preferences/com.apple.Terminal.plist
# Set that profile as the default
plutil -replace "Default Window Settings" -string "Mike's Profile" ~/Library/Preferences/com.apple.Terminal.plist
plutil -replace "Startup Window Settings" -string "Mike's Profile" ~/Library/Preferences/com.apple.Terminal.plist
# Set the default shell as the homebrew-installed bash
plutil -replace "Shell" -string "$(command -v bash)" ~/Library/Preferences/com.apple.Terminal.plist


# Git
brew install git
install-dotfile .gitignore_global
install-dotfile .gitconfig
install-dotfile .git-completion.bash

# Small command line tools
brew install wget
brew install nmap
brew install dos2unix


### CODING TOOLS ###
# ack
brew install ack
install-dotfile .ackrc

# vscode
brew install --cask visual-studio-code
ln -sf $(pwd)/settings/vscode.json ~/Library/Application\ Support/Code/User/settings.json


### LANGUAGES ###
# C
brew install gcc

# Rust
brew install rust

# Go
brew install go

# python
brew install pyenv
# Init pyenv so we can run pyenv commands in this script
eval "$(pyenv init --path)"
# Install python 3.10.0 and set it as the default
pyenv install 3.10.0 --skip-existing
pyenv global 3.10.0

pip install --upgrade pip
brew install pipenv

# Node
brew install nvm
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
nvm install 16
nvm alias default 16


###
brew install helm
brew install skaffold
brew install terraform

### 3rd Party CLIs ###
brew install doctl
brew install s3cmd
brew install awscli

### Databases ###
brew install postgresql

brew tap mongodb/brew
brew install mongodb-community@5.0
brew install sqlite


echo "Install finished."
echo "You need to fully quit terminal and re-open it"
