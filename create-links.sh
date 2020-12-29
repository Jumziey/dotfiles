#!/bin/bash

ignores=(
  "win-nvim-links.ps1"
  "create-links.sh"
  "dot-funcs.sh"
  "dot-funcs.bats"
  "create-symlinks.sh"
  ".gitignore"
  ".nvimrc"
  "arch-packages"
)

script_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# shellcheck source=bin/lib/backup/backup.sh
source "$script_root/bin/lib/backup/backup.sh"
host_root="$HOME"

backup_root="$script_root/backups/$(date +%m-%d-%y-%N)"
mkdir -p "$backup_root"

dotfiles=$(
  cd "$script_root" || exit
  git ls-files
)

for repo_file in $dotfiles; do
  #Making sure its not an ignored file
  echo "$repo_file"
  if ! ignored "$repo_file" "${ignores[@]}"; then
    backup "$backup_root" "$host_root" "$repo_file"
    link_dotfile "$script_root" "$host_root" "$repo_file"
  fi
done
