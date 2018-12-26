# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
# set system-wide hotkey to show/hide iterm with ^\`
defaults write com.googlecode.iterm2 Hotkey -bool true
defaults write com.googlecode.iterm2 HotkeyChar -int 96;
defaults write com.googlecode.iterm2 HotkeyCode -int 50;
# animate split-terminal dimming
defaults write com.googlecode.iterm2 HotkeyModifiers -int 262401;
# Make iTerm2 load new tabs in the same directory
/usr/libexec/PlistBuddy -c "set \"New Bookmarks\":0:\"Custom Directory\" Recycle" ~/Library/Preferences/com.googlecode.iterm2.plist
# setting fonts
defaults write com.googlecode.iterm2 "Normal Font" -string "Hack-Regular 18";
defaults write com.googlecode.iterm2 "Non Ascii Font" -string "Monaco 18";
