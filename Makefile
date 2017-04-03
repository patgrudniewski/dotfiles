install: vim tmux fish

vim:
	utils/install.sh \
		ctags \
		git \
		vim
	mkdir -p ~/.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.vim/swp
	mkdir -p ~/.vim/undo
	cp ./.vimrc ~/.vimrc
	vim +PlugInstall! -c qa!

tmux:
	cp ./.tmux.conf ~/.tmux.conf

fish:
	utils/install.sh fish
	chsh -s $$(cat /etc/shells | grep 'fish')
	curl -L https://get.oh-my.fish | fish
	omf install bobthefish

.PHONY: vim tmux fish install
