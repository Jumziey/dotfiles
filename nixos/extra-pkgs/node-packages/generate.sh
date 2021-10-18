#! /usr/bin/env nix-shell
#! nix-shell -p nodePackages.node2nix -i bash
# shellcheck shell=bash
#set -eu -o pipefail
cd "$( dirname "${BASH_SOURCE[0]}" )" || exit
[[ -f ./node-env.nix ]] && rm -f ./node-env.nix
node2nix -i node-packages.json -o node-packages.nix -c default.nix
