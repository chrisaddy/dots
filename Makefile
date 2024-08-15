link:
	stow hypr
	stow foot
	stow zsh
	stow waybar
	stow oh-my-posh
	stow lazydocker
	stow nvim
	stow tmux
	stow newsboat
	stow bat
	stow lf
	stow scripts
	find scripts/bin -type f -exec chmod +x {} \;
	mkdir -p /etc/greetd && cp greetd/etc/greetd/config.toml /etc/greetd
