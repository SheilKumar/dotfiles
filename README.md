# dotfiles

Personal development environment configuration for Neovim and tmux.

## Structure

```
dotfiles/
├── nvim/          # Neovim config (modular kickstart.nvim fork)
├── tmux/          # tmux config + plugins
└── install.sh     # Symlink everything into ~/.config
```

## Install

```sh
git clone <this-repo> ~/dev/dotfiles
cd ~/dev/dotfiles
./install.sh
```

This symlinks `nvim/` → `~/.config/nvim` and `tmux/` → `~/.config/tmux`, backing up any existing config to `*.bak`.

After installing:
- **tmux**: open tmux and press `prefix + I` to install plugins via TPM
- **nvim**: open `nvim` — lazy.nvim auto-installs all plugins on first launch

## Cheatsheet

See [nvim-tmux-cheatsheet.md](nvim-tmux-cheatsheet.md) for key bindings and workflow tips.
