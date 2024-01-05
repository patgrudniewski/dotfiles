oh-my-zsh:
	curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh --output /tmp/omz_install.sh
	chmod +x /tmp/omz_install.sh
	RUNZSH=no /tmp/omz_install.sh
	rm -rf /tmp/omz_install.sh

powerline:
	git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline
	/tmp/powerline/install.sh
	rm -rf /tmp/powerline

centos:
	# TODO

macos: oh-my-zsh powerline
	rm -f ~/.zshrc
	cp ./macos/.zshrc ~/.zshrc
	defaults write com.apple.Terminal "Window Settings" -dict-add "Solarized Dark - Patched" "$(shell cat ./macos/window-settings.xml)"
	defaults write com.apple.Terminal "NSWindow Frame TTWindow Solarized Dark - Patched" -string "0 84 1438 791 0 0 1440 875 "
	defaults write com.apple.Terminal "Default Window Settings" -string "Solarized Dark - Patched"
	defaults write com.apple.Terminal "Startup Window Settings" -string "Solarized Dark - Patched"

.PHONY: macos
