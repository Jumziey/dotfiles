#!/usr/bin/env bash

source ../filearray/filearray.sh

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


