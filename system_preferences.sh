# https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/
# https://apple.stackexchange.com/questions/79761/editing-system-preferences-via-terminal
#     cp -r /Library/Preferences before
# Manual changes
#     cp -r /Library/Preferences after
#     diff -ur before after

#     alias plist='plutil -convert xml1 -o /dev/stdout'
#     diff -u <(plist before/Preferences/com.apple.loginwindow.plist) <(plist after/Preferences/com.apple.loginwindow.plist)

# defaults read /Library/Preferences/com.apple.loginwindow SHOWFULLNAME
# 1
# sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool false
# defaults read /Library/Preferences/com.apple.loginwindow SHOWFULLNAME
# 0

# sudo su -
# visudo
#     %admin          ALL = (ALL) NOPASSWD:ALL

# enable remote login for $USER
sudo systemsetup -setremotelogin off
sudo dseditgroup -o delete -q com.apple.access_ssh
sudo dseditgroup -o create -q $USER -t user com.apple.access_ssh
sudo systemsetup -setremotelogin on

