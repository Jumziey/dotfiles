#!/usr/bin/env bash

SCRIPT_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)
# shellcheck source=../env
source "$SCRIPT_ROOT/../env"

# shellcheck source=../filearray/filearray.sh
source "$LIB_ROOT/filearray/filearray.sh"

lintsinglevimfile() {
	file="$1"
	echo "linting $file..."
	if vint "$file"; then 
		echo "SUCCESS"
	else 
		echo "FAIL"
	fi
}

lintvim(){
	path="$1"

	filearray "$path" "*.vim" vimfiles

	export -f lintsinglevimfile
	# shellcheck disable=SC2154
	SHELL="$(type -p bash)" parallel vint ::: "${vimfiles[@]}"
}


