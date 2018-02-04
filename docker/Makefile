install:
	../utils/install.sh \
		docker \
		docker-compose
	sudo groupadd --force --system docker
	sudo usermod -aG docker $(USER)

.PHONY: install
