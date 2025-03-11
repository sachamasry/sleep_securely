[private]
@help:
	just --list

# Add shell script executable status
[private]
chmod:
	@echo "==> Setting executable flag"
	chmod +x ./scripts/sleep_securely.sh
	@echo "--> Executable flag successfully set\n"

# Install script
install: chmod
	@echo "==> Installing script"
	cp ./scripts/sleep_securely.sh ~/bin/sleep_securely.sh
	@echo "--> Script successfully installed\n"
