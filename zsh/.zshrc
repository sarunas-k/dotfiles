[ -n "$PS1" ] && source ~/.zsh_profile;

# Plugins: first match wins (Homebrew on Linux, Debian/Ubuntu, Arch)
for plugin in zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search; do
	for dir in /home/linuxbrew/.linuxbrew/share /usr/share /usr/share/zsh/plugins; do
		for file in "$dir/$plugin/$plugin.zsh" "$dir/$plugin/$plugin.plugin.zsh"; do
			[ -r "$file" ] && { source "$file"; break 2; }
		done
	done
done
unset plugin dir file

command -v zoxide >/dev/null && eval "$(zoxide init zsh --cmd cd)"
