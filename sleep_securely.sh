#!/bin/bash

# Disable Wi-Fi
networksetup -setairportpower en0 off

# Disable Bluetooth
#blueutil -p 0

# Unmount all external volumes
diskutil list external | grep -E '^\/' | while read -r volume; do
    diskutil unmount "$volume"
done

# Disable Tailscale
/Applications/Tailscale.app/Contents/MacOS/Tailscale down

# Mute system volume to prevent unpleasant surprises!
osascript -e "set volume with output muted"
