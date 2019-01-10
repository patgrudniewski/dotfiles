install:
	sudo pip3 install powerline-status
	$(eval POWERLINE_PATH := $(shell pip3 show powerline-status | grep 'Location' | cut -d' ' -f 2))
	../utils/install.sh \
		tmux
	echo 'source "$(POWERLINE_PATH)/powerline/bindings/tmux/powerline.conf"' | cat - ./.tmux.conf > /tmp/.tmux.conf
	mv /tmp/.tmux.conf ~/.tmux.conf

.PHONY: install
