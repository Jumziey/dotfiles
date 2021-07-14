#!/usr/bin/env bash

ignores=(
	"qwerty.txt"
  "dev-bin/nvim-config-lint"
  "win-nvim-links.ps1"
  "create-links.sh"
  "dot-funcs.sh"
  "dot-funcs.bats"
  "create-symlinks.sh"
  ".gitignore"
  ".nvimrc"
	"buildspec.yml"
)

script_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# shellcheck source=bin/lib/backup/backup.sh
source "$script_root/bin/lib/backup/backup.sh"
host_root="$HOME"

backup_root="$script_root/backups/$(date +%m-%d-%y-%N)"
mkdir -p "$backup_root"

dotfiles=$(
  cd "$script_root" || exit
  git ls-files | grep -v nixos
)

for repo_file in $dotfiles; do
  #Making sure its not an ignored file
  if ! ignored "$repo_file" "${ignores[@]}"; then
		echo "$repo_file"
    backup "$backup_root" "$host_root" "$repo_file"
    link_dotfile "$script_root" "$host_root" "$repo_file"
  fi
done

nixos_files=$(
  cd "$script_root" || exit
  git ls-files | grep nixos
)

nixos_root=/etc/
for nixos_file in $nixos_files; do
	if ! ignored "$nixos_file" "${ignores[@]}"; then
		echo "$nixos_file"
    link_dotfile "$script_root" "$nixos_root" "$nixos_file"
  fi
done
