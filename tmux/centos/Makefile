repository:
	wget -O /tmp/epel.rpm  http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
	rpm -qa | grep epel || sudo rpm -ivh /tmp/epel.rpm
	sudo yum install -y python36-pip python36-devel
	sudo ln -s $(shell which pip3.6) /usr/bin/pip3

.PHONY: repository
