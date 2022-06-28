install:
	../utils/install.sh \
		fontconfig
	sudo wget -O /usr/share/fonts/PowerlineSymbols.otf https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
	fc-cache -vf /usr/share/fonts
	sudo wget -O /etc/fonts/conf.d/10-powerline-symbols.conf https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

.PHONY: install
