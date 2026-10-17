#!/usr/bin/env bash
# Symlink the files of the given packages into $HOME, e.g. ./install.sh bash shell git config
# Existing files are moved to <name>.bak (or <name>.bak.N if that exists) before linking.
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for pkg in "$@"; do
	[ -d "${repo}/${pkg}" ] || { echo "Unknown package: ${pkg}" >&2; exit 1; }
	while IFS= read -r -d '' file; do
		rel="${file#"${repo}/${pkg}/"}"
		target="${HOME}/${rel}"
		mkdir -p "$(dirname "${target}")"

		if [ -L "${target}" ] && [ "$(readlink "${target}")" = "${file}" ]; then
			echo "ok     ~/${rel}"
			continue
		fi

		if [ -e "${target}" ] || [ -L "${target}" ]; then
			backup="${target}.bak"
			n=1
			while [ -e "${backup}" ] || [ -L "${backup}" ]; do
				backup="${target}.bak.${n}"
				n=$((n + 1))
			done
			mv "${target}" "${backup}"
			echo "backup ~/${rel} -> ${backup}"
		fi

		ln -s "${file}" "${target}"
		echo "linked ~/${rel}"
	done < <(find "${repo}/${pkg}" -type f -print0)
done
