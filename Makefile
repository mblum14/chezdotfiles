default: nvim_state.tar.gz

.PHONY: nvim
nvim: ~/.config/nvim
	cp -r --remove-destination ~/.config/nvim private_dot_config/

.PHONY: lazy_lock
lazy_lock:
	rm private_dot_config/nvim/lazy-lock.json
	cp ~/.local/share/chezmoi/lazy-lock.json private_dot_config/nvim/

nvim_state.tar.gz: nvim lazy_lock
	unlink ~/.local/nvim/lazy-lock.json
	cp ~/.local/share/chezmoi/lazy-lock.json ~/.config/nvim/
	tar -czf nvim_state.tar.gz ~/.local/state/nvim/ ~/.local/share/nvim ~/.config/nvim
	rm ~/.local/nvim/lazy-lock.json
	ln -s ~/.local/share/chezmoi/lazy-lock.json ~/.config/nvim/
