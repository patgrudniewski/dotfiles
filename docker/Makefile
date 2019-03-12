install:
	../utils/install.sh \
		docker
	sudo groupadd --force --system docker
	sudo usermod -aG docker $(USER)
	sudo systemctl enable docker
	sudo systemctl start docker
	sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(shell uname -s)-$(shell uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

.PHONY: install
