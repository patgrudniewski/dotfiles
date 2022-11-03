install:
	brew install \
		tmux
	mkdir -p ~/.tmux
	rm -rf ~/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/bin/install_plugins
	cp ./.tmux.conf ~/.tmux.conf

