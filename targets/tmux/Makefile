TPM_DIR = $(HOME)/.tmux/plugins/tpm

centos: install

macos:
	brew install \
		tmux
	$(MAKE) install

install:
	@if [ ! -d "$(TPM_DIR)" ]; then \
		git clone https://github.com/tmux-plugins/tpm $(TPM_DIR); \
	fi
	cp .tmux.conf ~/.tmux.conf
	tmux start-server\; source-file ~/.tmux.conf
	$(TPM_DIR)/bin/install_plugins
