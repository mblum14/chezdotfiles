default: build

.PHONY: nvim
nvim: ~/.config/nvim
	cp -r --remove-destination ~/.config/nvim private_dot_config/

.PHONY: lazy_lock
lazy_lock:
	rm private_dot_config/nvim/lazy-lock.json
	cp ~/.local/share/chezmoi/lazy-lock.json private_dot_config/nvim/

nvim_state.tar.gz: nvim lazy_lock
	unlink ~/.config/nvim/lazy-lock.json
	cur_dir=$(shell pwd)
	cp $(HOME)/.local/share/chezmoi/lazy-lock.json ~/.config/nvim/
	tar -czf nvim_state.tar.gz -C $(HOME) .local/state/nvim/ .local/share/nvim .config/nvim -C /alt .local/nvim
	rm ~/.config/nvim/lazy-lock.json
	ln -s ~/.local/share/chezmoi/lazy-lock.json ~/.config/nvim/

tmux_state.tar.gz: private_dot_config/tmux/tmux.conf
	tar -czf tmux_state.tar.gz -C $(HOME) .config/tmux

build: nvim_state.tar.gz tmux_state.tar.gz
