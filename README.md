.Dotfiles
---------

My attempt to backup my dotfiles.

## How To Use

### Neovim

To export the neovim config, you need to make a symbolic link to nvim in .config folder in your $HOME.

```bash
foo@bar:~/.config$ ln -s <path-to-dotfiles-repo>/nvim
```

### Tmux

To export the tmux config, you need to make a symbolic link to tmux in .config folder in your $HOME.

```bash
foo@bar:~/.config$ ln -s <path-to-dotfiles-repo>/tmux
```
### Sway

To export the sway config, you need to make a symbolic link to sway in .config folder in your $HOME.
A ```launcher``` script is also needed for this. This script is located on ```scripts``` folder. 

```bash
foo@bar:~/.config$ ln -s <path-to-dotfiles-repo>/sway
foo@bar:~/.config$ cd /usr/local/bin/
foo@bar:/usr/local/bin$ sudo ln -s <path-to-dotfiles-repo>/scripts/launcher
```

