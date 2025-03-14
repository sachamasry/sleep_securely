#!/bin/bash

# Quit KeePassXC upon sleep
/usr/bin/killall KeePassXC

# Tell Parallels Desktop application to quit gently, if it is already open
if pgrep -q prl_client; then
    osascript -e 'tell application "Parallels Desktop" to quit'
fi

# Disable Wi-Fi
networksetup -setairportpower en0 off

# Disable Bluetooth
/opt/homebrew/bin/blueutil -p 0

# Lower connection permissions to 'Contacts Only'
defaults write com.apple.sharingd DiscoverableMode -string "Contacts Only"

# Disable AirDrop discoverability
defaults write com.apple.sharingd DiscoverableMode -string "Off"

# Restart the sharingd service for the above changes to take effect
killall sharingd

# Unmount all external volumes
diskutil list external | grep -E '^\/' | while read -r volume; do
    diskutil unmount "$volume"
done

# Disable Tailscale
if [ -x "/Applications/Tailscale.app/Contents/MacOS/Tailscale" ]; then
    "/Applications/Tailscale.app/Contents/MacOS/Tailscale" down
fi

# Mute system volume to prevent unpleasant surprises!
osascript -e "set volume with output muted"

# Close all email applications (MUAs)
pkill -x "Proton Mail"
pkill -x "Thunderbird"
pkill -x "thunderbird"
pkill -x "Mail"

# Close sensitive communication applications
pkill -x "Discord"
pkill -x "FaceTime"
pkill -x "Messages"
pkill -x "Microsoft Teams"
pkill -x "Signal"
pkill -x "Skype"
pkill -x "Slack"
pkill -x "Telegram"
pkill -x "Trello"
pkill -x "Viber"
pkill -x "WhatsApp"

pkill -x "Zoom"
pkill -x "Zoom.us"
pkill -x "zoom"
pkill -x "zoom.us"

pkill -x "Authy Desktop"

# Clear clipboard contents
/usr/bin/pbcopy < /dev/null

# Clear SSH agent identities
ssh-add -D

# Securely wipe SSH agent
killall ssh-agent

# Download trace elimination
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* "DELETE FROM LSQuarantineEvent;"

DELETE FROM LSQuarantineEvent;

# Traverse the user's home directory, searching for, and deleting all `.DS_Store` files
find ~/ -type f -name ".DS_Store" -delete
