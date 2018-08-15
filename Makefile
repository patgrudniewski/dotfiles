DIRS = $(shell find . -maxdepth 1 -mindepth 1 -type d | grep -v '\.git\|utils')

install: $(DIRS)

fish: git
	$(MAKE) -C fish

vim: git
	$(MAKE) -C vim

docker git google-chrome kde tmux yakuake:
	$(MAKE) -C $@

.PHONY: install docker fish git google-chrome kde tmux vim yakuake
