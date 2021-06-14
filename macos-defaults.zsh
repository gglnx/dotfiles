#!/usr/bin/env zsh

# Theme and colors
defaults write NSGlobalDomain AppleHighlightColor -string '0.847059 0.847059 0.862745 Graphite'
defaults write NSGlobalDomain AppleInterfaceStyle -string 'Dark'
defaults write NSGlobalDomain AppleAquaColorVariant -int 6

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show always the file extension in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Open everything always in tabs
defaults write NSGlobalDomain AppleWindowTabbingMode -string 'always'

# Don't show icons on Desktop
defaults write com.apple.finder CreateDesktop -bool false

# Enable developer menu in Safari
defaults write com.apple.Safari IncludeDebugMenu 1

# Set iTerm settings path
defaults write com.googlecode.iterm2 PrefsCustomFolder -string '~/.dotfiles/config/iterm2/'

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string '~/Desktop'

# Save screenshots in PNG format
defaults write com.apple.screencapture type -string "png"

# Set Desktop as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string 'file://${HOME}/Desktop/'

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Dock
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock mineffect -string 'scale'
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock orientation -string 'bottom'
defaults write com.apple.dock tilesize -int 32
defaults write com.apple.dock largesize -float 64
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock size-immutable -bool true
defaults write com.apple.dock show-recents -bool false

# Set login window text
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText -string '@gglnx, +4917684025950, info@dennismorhardt.de'

# Set clock format
defaults write com.apple.menuextra.clock DateFormat -string 'EEE d. MMM  HH:mm:ss'

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'

# Restart applications
for app in "Activity Monitor" \
    "cfprefsd" \
    "Dock" \
    "Finder" \
    "SystemUIServer"; do
    killall "${app}" &> /dev/null
done
