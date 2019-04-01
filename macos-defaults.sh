#!/usr/bin/env bash

# Theme and colors
defaults write NSGlobalDomain AppleHighlightColor -string '0.847059 0.847059 0.862745'
defaults write NSGlobalDomain AppleInterfaceStyle -string 'Dark'
defaults write NSGlobalDomain AppleAquaColorVariant -int 6

# Open everything always in tabs
defaults write NSGlobalDomain AppleWindowTabbingMode -string 'always'

# Show always the file extension in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Don't open Photos.app after connecting an iDevice
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Crash Reporter as notification instead of a popup
defaults write com.apple.CrashReporter UseUNC 0

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Dock settings
defaults write com.apple.dock tilesize -int 32
defaults write com.apple.dock largesize -float 52
defaults write com.apple.dock size-immutable -bool true
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock mineffect -string 'scale'
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock show-recents -bool false

# Set login window text
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText -string '@gglnx, +4917684025950, info@dennismorhardt.de'

# Trackpad settings
# Disable Force Click
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool false
defaults -currentHost write NSGlobalDomain com.apple.trackpad.forceClick -bool false

# Set scroll direction to natural
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
defaults -currentHost write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Map bottom right corner to right-click
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1

# Multitouch gestures
defaults -currentHost write NSGlobalDomain com.apple.trackpad.fiveFingerPinchSwipeGesture -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.fourFingerHorizSwipeGesture -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.fourFingerVertSwipeGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.momentumScroll -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.pinchGesture -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.rotateGesture -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.scrollBehavior -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerDragGesture -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerTapGesture -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerVertSwipeGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.twoFingerDoubleTapGesture -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.twoFingerFromRightEdgeSwipeGesture -int 0

# Scroll speed
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 0.875

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format
defaults write com.apple.screencapture type -string "png"

# Set Desktop as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string 'file://${HOME}/Desktop/'

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write -g AppleShowAllFiles -bool true

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

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'

# Expand the following File Info panes:
# General, Open with, and Sharing & Permissions
defaults write com.apple.finder FXInfoPanesExpanded -dict General -bool true OpenWith -bool true Privileges -bool true

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string 'CPUUsage'
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Use plain text mode in TextEdit
defaults write com.apple.TextEdit RichText -int 0

# Don't show icons on Desktop
defaults write com.apple.finder CreateDesktop -bool false

# Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed before.
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

# Enable developer menu in Safari
defaults write com.apple.Safari IncludeDebugMenu 1

# Set iTerm settings path
defaults write com.googlecode.iterm2 PrefsCustomFolder -string '~/.dotfiles/config/iterm2/'

# Restart applications
for app in "Activity Monitor" \
    "cfprefsd" \
    "Dock" \
    "Finder" \
    "Photos" \
    "SystemUIServer"; do
    killall "${app}" &> /dev/null
done
