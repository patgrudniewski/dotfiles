install:
	../utils/install.sh \
		fish
	cp config.fish ~/.config/fish/config.fish
	chsh -s $$(cat /etc/shells | grep 'fish')
	git clone https://github.com/oh-my-fish/oh-my-fish
	oh-my-fish/bin/install --offline --noninteractive --yes
	rm -rf oh-my-fish

.PHONY: install
