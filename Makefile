OS := $(shell hostnamectl status | grep -i 'Operating System' | cut -d: -f2 | tr -d '[0-9. ]' | tr '[:upper:]' '[:lower:]')
Workspace := $(PWD)/Workspace

os-bootstrap: dump $(OS)
	@test -d $(Workspace) || mkdir $(Workspace)
	@test -d $(Workspace)/neovim-config || git clone https://github.com/huiwei-menory/neovim-config.git $(Workspace)/neovim-config
	@test -d ~/.config/kitty || git clone https://github.com/ttys3/my-kitty-config.git ~/.config/kitty
	@test -d $(Workspace)/starship-config || (git clone https://github.com/ttys3/starship-config $(Workspace)/starship-config && \
		cd $(Workspace)/starship-config && make install && cd $(PWD))

#@sudo curl -fL https://github.com/ttys3/starship-config/releases/download/v0.2.0/os-icon.linux_amd64  -o /usr/local/bin/os-icon && \
#sudo chmod +x /usr/local/bin/os-icon

#curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

#sh -c "$(curl -fsSL https://starship.rs/install.sh)"

dump:
	@echo Workspace: $(Workspace)

os:
	@echo OS: $(OS)

archlinux: os
	@echo "archlinux running..."
