#!/bin/bash

# Ensure duti is installed
if ! command -v duti &> /dev/null; then
    echo "duti could not be found, please install it using Homebrew: brew install duti"
    exit 1
fi

# Set VSCode as default text editor for text files...
duti -s com.microsoft.VSCode public.plain-text all # Blank files (no extension)
duti -s com.microsoft.VSCode .txt all
duti -s com.microsoft.VSCode .zsh all
duti -s com.microsoft.VSCode .md all
duti -s com.microsoft.VSCode .sh all
duti -s com.microsoft.VSCode .json all
duti -s com.microsoft.VSCode .py all
duti -s com.microsoft.VSCode .Fastfile all
duti -s com.microsoft.VSCode .tex all
duti -s com.microsoft.VSCode .yml all

echo "Default text editor updated successfully."

# Setup Dock Preferences
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock largesize -int 50
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock static-only -bool false # Only show currently running apps
defaults write com.apple.dock show-recents -bool true

# Setup Finder Preferences
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv" # Use column view in Finder
defaults write com.apple.finder NewWindowTarget -string "PfHm" # Open new Finder windows on home directory (both lines required).
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/" # Open new Finder windows on home directory (both lines required).
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:arrangeBy grid' ~/Library/Preferences/com.apple.finder.plist # Snap to grid on Desktop i
killall Finder

# Enable Dark Mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

# Setup Trackpad Preferences
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool false

defaults write -g com.apple.trackpad.scaling -float 1.727492
defaults write -g com.apple.mouse.scaling -float 1.727492

defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15

killall SystemUIServer

echo "🚨 Some preferences may require a restart to take effect. Please restart your Mac to ensure all settings are applied correctly."