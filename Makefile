install: docker fish git google-chrome guake postman tmux vim

fish: git
	$(MAKE) -C fish

vim: git
	$(MAKE) -C vim

docker git google-chrome guake kde postman tmux yakuake:
	$(MAKE) -C $@

.PHONY: install docker fish git google-chrome guake kde postman tmux vim yakuake
