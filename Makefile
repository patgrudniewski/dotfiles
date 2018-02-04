DIRS = $(shell find . -maxdepth 1 -mindepth 1 -type d | grep -v '\.git\|utils')

install: $(DIRS)

fish: git
	$(MAKE) -C fish

vim: curl git
	$(MAKE) -C vim

curl git kde tmux yakuake:
	$(MAKE) -C $@

.PHONY: install curl fish git kde tmux vim yakuake
