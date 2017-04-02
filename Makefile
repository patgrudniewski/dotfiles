install: vim tmux

vim:
	mkdir -p ~/.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.vim/swp
	mkdir -p ~/.vim/undo
	cp ./.vimrc ~/.vimrc
	vim +PlugInstall -c qa!

tmux:
	cp ./.tmux.conf ~/.tmux.conf

.PHONY: vim tmux install
