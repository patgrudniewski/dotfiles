install:
	../utils/install.sh \
		tmuxinator \
		tmux-powerline \
		tmux
	if [ -f '/usr/share/tmux/powerline.conf' ]; then cp .tmux.conf ~/.tmux.conf; fi # @TODO: remove conditional when tmux-powerline for alpine issue will be solved

.PHONY: install
