# vi: ft=sh

# https://macos-defaults.com/

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock no-bouncing -bool true
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock static-only -bool true
killall Dock

# Screenshots
defaults write com.apple.screencapture "location" -string "~/Pictures"
killall SystemUIServer

# Finder
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
killall Finder
