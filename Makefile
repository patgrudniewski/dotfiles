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

install: $(TARGETS_ALLOWED)

$(filter %, $(TARGETS_ALLOWED)):
	$(MAKE) -C $(TARGETS_DIR)/$@ $(OS_NAME)
