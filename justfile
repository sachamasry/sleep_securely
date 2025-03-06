[private]
@help:
	just --list

# Add shell script executable status
[private]
chmod:
	echo "==> Adding executable flag"
	chmod +x ./sleep_securely.sh
	echo "--> Executable flag set"

# Install script
install: chmod
	echo "==> Installing script"
	sudo cp ./sleep_securely.sh /usr/local/bin/sleep_securely.sh
	echo "--> Script successfully installed"
