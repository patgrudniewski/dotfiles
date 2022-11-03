install: tmux vim

tmux:
	$(MAKE) -C tmux
vim: 
	$(MAKE) -C vim

.PHONY: install tmux vim
