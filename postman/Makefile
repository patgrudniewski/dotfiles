install:
	wget https://dl.pstmn.io/download/latest/linux64 -O /tmp/postman.tgz
	sudo tar -xvzf /tmp/postman.tgz -C /opt
	sudo mv /opt/Postman /opt/postman
	sudo ln -s /opt/postman/Postman /usr/local/bin/postman
	cp ./postman.desktop ~/.local/share/applications/postman.desktop

.PHONY: install
