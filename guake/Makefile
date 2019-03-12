CONFIG_PATH=~/.config/gconf/apps/guake
install:
	../utils/repositoryInstaller.sh guake
	../utils/install.sh \
		guake
	mkdir -p $(CONFIG_PATH)
	mkdir -p ~/.config/autostart
	cp -Rv ./general $(CONFIG_PATH)/general
	cp -Rv ./keybindings $(CONFIG_PATH)/keybindings
	cp -Rv ./style $(CONFIG_PATH)/style
	cp -v ./guake.desktop ~/.config/autostart/guake.desktop
	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Guake'"
	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'guake'"
	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'F1'"
	dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

.PHONY: install
