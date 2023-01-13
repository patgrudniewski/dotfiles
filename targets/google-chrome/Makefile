TMP_DIR = /tmp/dotfiles/chrome

macos:
	brew install --cask google-chrome

centos:
	sudo update-crypto-policies --set DEFAULT:SHA1
	sudo cp -v ./rhel/google-chrome.repo /etc/yum.repos.d/google-chrome.repo
	sudo dnf install google-chrome-stable

