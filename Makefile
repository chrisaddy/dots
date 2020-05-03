backup: commit pull push
pull:
	git pull origin master

commit:
	git add .
	git commit -m "backup $(shell date)"

push:
	git push origin master

links:
	ln -sf $(HOME)/dotfiles/.vimrc $(HOME)/.vimrc
	ln -sf $(HOME)/dotfiles/.zshrc $(HOME)/.zshrc
	ln -sf $(HOME)/dotfiles/.gitconfig $(HOME)/.gitconfig
	ln -sf $(HOME)/dotfiles/.gitignore $(HOME)/.gitignore
	ln -sf $(HOME)/dotfiles/.i3 $(HOME)/.i3
