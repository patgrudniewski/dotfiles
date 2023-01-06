USERNAME = $(shell whoami)
macos:
	# TODO: needs implementation

centos:
	 sudo dnf install \
		 yum-utils
	 sudo yum-config-manager \
		 --add-repo https://download.docker.com/linux/centos/docker-ce.repo
	 sudo yum install \
		 docker-ce \
		 docker-ce-cli \
		 containerd.io \
		 docker-compose-plugin
	 sudo sh -c 'echo "{\"hosts\": [\"tcp://0.0.0.0:2375\", \"unix://var/run/docker.sock\"]}" | jq > /etc/docker/daemon.json'
	 sudo mkdir -p /etc/systemd/system/docker.service.d
	 sudo cp -v ./rhel/override.conf /etc/systemd/system/docker.service.d/override.conf
	 sudo systemctl enable docker
	 sudo systemctl start docker
	 sudo usermod -aG docker $(USERNAME)
	 sudo cp -v ./rhel/docker-compose.sh /usr/local/bin/docker-compose
	 sudo chmod +x /usr/local/bin/docker-compose
