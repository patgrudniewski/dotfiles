install:
	../utils/install.sh \
		ctags \
		python3-pip \
		the_silver_searcher \
		vim
	sudo pip3 install py3kwarn
	mkdir -p ~/.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.vim/swp
	mkdir -p ~/.vim/undo
	mkdir -p ~/.vim/ftplugin
	cp -R ftplugin/* ~/.vim/ftplugin/
	cp .vimrc ~/.vimrc
	vim +PlugInstall! -c qa!

.PHONY: install
