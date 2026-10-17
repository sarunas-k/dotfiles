# dotfiles

Linux dotfiles, split into packages that mirror `$HOME`:

| Package | Contents |
| :--- | :--- |
| `bash/` | `.bashrc`, `.bash_profile`, `.bash_prompt`, `.bash_logout` |
| `zsh/` | `.zshrc`, `.zsh_profile`, `.zsh_prompt`, `.zsh_aliases` |
| `shell/` | `.aliases` |
| `git/` | `.gitconfig` |
| `config/` | `.config/gh/` |

Install by symlinking the packages you want:

```bash
./install.sh bash shell git config # bash setup
./install.sh zsh git config          # zsh setup
```

Existing files are never overwritten: they are moved to `<name>.bak` (or `<name>.bak.1`, `.bak.2`, ... if a backup already exists) before the symlink is created. Files that are already linked correctly are skipped, so the script is safe to re-run.
