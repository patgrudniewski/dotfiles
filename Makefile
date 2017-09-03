DIRS = $(shell find . -maxdepth 1 -mindepth 1 -type d | grep -v '\.git\|utils')

install: $(DIRS)

fish: git
	$(MAKE) -C fish

vim: git
	$(MAKE) -C vim

git kde tmux yakuake:
	$(MAKE) -C $@

.PHONY: install fish git kde tmux vim yakuake
