#!/bin/bash

# Quit KeePassXC upon sleep
/usr/bin/killall KeePassXC

# Tell Parallels Desktop application to quit gently
osascript -e 'tell application "Parallels Desktop" to quit'

# Disable Wi-Fi
networksetup -setairportpower en0 off

# Disable Bluetooth
/opt/homebrew/bin/blueutil -p 0

# Unmount all external volumes
diskutil list external | grep -E '^\/' | while read -r volume; do
    diskutil unmount "$volume"
done

# Disable Tailscale
/Applications/Tailscale.app/Contents/MacOS/Tailscale down

# Mute system volume to prevent unpleasant surprises!
osascript -e "set volume with output muted"
