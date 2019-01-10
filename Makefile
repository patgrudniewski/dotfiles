install: docker fish git google-chrome guake postman tmux vim

fish: git
	$(MAKE) -C fish

tmux: powerline
	$(MAKE) -C tmux

vim: git powerline
	$(MAKE) -C vim

docker git google-chrome guake kde postman powerline yakuake:
	$(MAKE) -C $@

.PHONY: install docker fish git google-chrome guake kde postman powerline tmux vim yakuake
