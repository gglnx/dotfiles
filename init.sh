#!/usr/bin/env bash

set -e

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update defaults
echo "Updating defaults..."
./macos-defaults.sh

# Install Homebrew
if [ ! -x /usr/local/bin/brew ]; then
    echo "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Accept XCode terms
sudo xcodebuild -license accept

# Brew bundle
echo "Install all Taps, Brews, Casks and Mas from Brewfile..."
brew bundle

# Install oh-my-zsh
if [ ! -x ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g')"
fi

# Install spaceship
if [ ! -x ~/.oh-my-zsh/custom/themes/spaceship-prompt ]; then
    git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
    ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
fi

# Install powerline fonts
if [ ! -x ~/.oh-my-zsh/custom/fonts/powerline ]; then
    mkdir -p ~/.oh-my-zsh/custom/fonts
    git clone https://github.com/powerline/fonts.git ~/.oh-my-zsh/custom/fonts/powerline
    ~/.oh-my-zsh/custom/fonts/powerline/install.sh Hack
fi

# Install asdf
if [ ! -x ~/.asdf ]; then
    echo "Installing asdf..."
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    sh -c 'cd ~/.asdf && git checkout "$(git describe --abbrev=0 --tags)"'
    ~/.asdf/bin/asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
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
