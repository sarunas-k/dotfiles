# dotfiles

Dotfiles split into packages that mirror `$HOME`

| Package | Contents |
| :--- | :--- |
| `bash/` | `.bashrc`, `.bash_profile`, `.bash_prompt`, `.bash_logout` (Linux) |
| `zsh/` | `.zshrc`, `.zprofile`, `.zsh_profile`, `.zsh_prompt`, `.zsh_aliases` (macOS) |
| `shell/` | `.aliases` |
| `git/` | `.gitconfig` |
| `config/` | `.config/gh/` |

Install by symlinking the packages you want:

```bash
./install.sh bash shell git config # bash setup
./install.sh zsh git config        # zsh setup
```

Existing files are never overwritten: they are moved to `<name>.bak` before the symlink is created. Script is safe to re-run.
