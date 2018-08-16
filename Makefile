install: docker fish git google-chrome guake tmux vim

fish: git
	$(MAKE) -C fish

vim: git
	$(MAKE) -C vim

docker git google-chrome guake kde tmux yakuake:
	$(MAKE) -C $@

.PHONY: install docker fish git google-chrome guake kde tmux vim yakuake
