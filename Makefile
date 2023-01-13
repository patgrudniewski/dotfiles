# targets definition
TARGETS_DIR = ./targets
TARGETS_ALLOWED = $(shell ls $(TARGETS_DIR))

# os discovery
OS_UNAME = $(shell uname -s)
ifeq ($(OS_UNAME), Darwin)
	OS_NAME = macos
else ifeq ($(OS_UNAME), Linux)
	ifneq ("$(wildcard /etc/os-release)", "")
		include /etc/os-release
		OS_NAME = $(subst ",,$(ID))
	endif
endif

brew:
	curl https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh --output /tmp/brew_install.sh
	chmod +x /tmp/brew_install.sh
	/tmp/brew_install.sh
	rm -rf /tmp/brew_install.sh


centos:
	# do nothing

macos: brew

install: $(OS_NAME) $(TARGETS_ALLOWED)

$(filter %, $(TARGETS_ALLOWED)):
	$(MAKE) -C $(TARGETS_DIR)/$@ $(OS_NAME)
