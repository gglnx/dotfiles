#!/usr/bin/env zsh
set -e

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Find out macos version
OLDIFS=$IFS
IFS='.' read osvers_major osvers_minor osvers_dot_version <<< "$(/usr/bin/sw_vers -productVersion)"
IFS=$OLDIFS

# Update defaults
echo "Updating defaults..."
./macos-defaults.zsh

# Install Rosetta
if [[ ${osvers_major} -ge 11 ]]; then
    if [[ $(arch) = 'arm64' ]]; then
        if [[ ! -f "/Library/Apple/System/Library/LaunchDaemons/com.apple.oahd.plist" ]]; then
            /usr/sbin/softwareupdate --install-rosetta --agree-to-license
        fi
    fi
fi

# Dotbot
CONFIG="install.conf.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"

# Set default shell
chsh -s $(which zsh)

# Install oh-my-zsh
if [ ! -x ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install spaceship
if [ ! -x ~/.oh-my-zsh/custom/themes/spaceship-prompt ]; then
    git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1
    ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
fi

# Install zsh-nvm
if [ ! -x  ~/.oh-my-zsh/custom/plugins/zsh-nvm ]; then
    git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
fi

# Install powerline fonts
if [ ! -x ~/.oh-my-zsh/custom/fonts/powerline ]; then
    mkdir -p ~/.oh-my-zsh/custom/fonts
    git clone https://github.com/powerline/fonts.git ~/.oh-my-zsh/custom/fonts/powerline
    ~/.oh-my-zsh/custom/fonts/powerline/install.sh Hack
fi

# Source zsh
source ~/.zshrc

# Install Homebrew (intel)
if [ ! -x /usr/local/bin/brew ]; then
    echo "Installing x86 Homebrew..."
    arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Homebrew (apple slicon)
if [[ $(arch) = 'arm64' ]]; then
    echo "Installing arm64 Homebrew..."
    sudo mkdir -p /opt/homebrew
    sudo chown -R $(whoami):staff /opt/homebrew
    (cd /opt && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew)
fi

# Brew bundle
echo "Install all Taps, Brews, Casks and Mas from Brewfile..."
brew bundle

# Remove asdf
if [ -x ~/.asdf ]; then
    echo "Removing asdf..."
    rm -rf ~/.asdf
fi
