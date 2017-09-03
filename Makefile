install: git vim tmux yakuake kde fish

git:
	utils/install.sh \
		git
	cp git/.gitconfig ~/.gitconfig

vim:
	utils/install.sh \
		ctags \
		vim
	mkdir -p ~/.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.vim/swp
	mkdir -p ~/.vim/undo
	mkdir -p ~/.vim/ftplugin
	cp -R ./vim/ftplugin/* ~/.vim/ftplugin/
	cp ./vim/.vimrc ~/.vimrc
	vim +PlugInstall! -c qa!

tmux:
	utils/install.sh \
		tmuxinator \
		tmux-powerline \
		tmux
	cp ./.tmux.conf ~/.tmux.conf

fish:
	utils/install.sh fish
	cp ./config.fish ~/.config/fish/config.fish
	chsh -s $$(cat /etc/shells | grep 'fish')
	git clone https://github.com/oh-my-fish/oh-my-fish
	oh-my-fish/bin/install --offline --noninteractive --yes
	rm -rf oh-my-fish

kde:
	cp kde/kwinrc ~/.config/kwinrc
	cp kde/kglobalshortcutsrc ~/.config/kglobalshortcutsrc

yakuake:
	utils/install.sh \
		yakuake
	mkdir -p ~/.config/autostart
	cp yakuake/yakuakerc ~/.config/yakuakerc
	cp yakuake/yakuake.desktop ~/.config/autostart/yakuake.desktop

.PHONY: git vim tmux fish yakuake kde install
