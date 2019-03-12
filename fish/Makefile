install:
	sudo ../utils/repositoryInstaller.sh fish
	./deps.sh
	../utils/install.sh \
		fish
	mkdir -p ~/.config/fish
	cp config.fish ~/.config/fish/config.fish
	chsh -s $$(cat /etc/shells | grep -m 1 'fish')
	git clone https://github.com/oh-my-fish/oh-my-fish
	oh-my-fish/bin/install --offline --noninteractive --yes
	rm -rf oh-my-fish
	fish -c "omf install bobthefish"

.PHONY: install
