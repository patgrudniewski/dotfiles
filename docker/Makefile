install:
	../utils/install.sh \
		docker \
		docker-compose
	sudo groupadd --force --system docker
	sudo usermod -aG docker $(USER)
	sudo systemctl enable docker
	sudo systemctl start docker

.PHONY: install
