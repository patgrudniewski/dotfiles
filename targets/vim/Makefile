centos: build
macos: macos-deps build

macos-deps:
	brew install \
		ctags \
		python3 \
		the_silver_searcher

build: 
	mkdir -p ~/.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.vim/swp
	mkdir -p ~/.vim/undo
	mkdir -p ~/.vim/ftplugin
	cp -R ftplugin/* ~/.vim/ftplugin/
	cp .vimrc ~/.vimrc
	vim +PlugInstall! -c qa!
