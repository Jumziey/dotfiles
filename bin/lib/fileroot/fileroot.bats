#!/usr/bin/env bats

source fileroot.sh

@test "fileroot finds absolute path of file root" {
	filepath="testdir/subdir/file"


	createfilepath "$filepath"

	froot=$(fileroot "$filepath")

	rmfilepath $filepath

	expectedfileroot="$PWD/$(dirname $filepath)"

	[[ $froot ==  "$expectedfileroot" ]]
}

createfilepath() {
	filepath="$1"
	mkdir -p $(dirname "$filepath")
	touch "$filepath"
}

rmfilepath() {
	filepath="$1"
	rm "$filepath"

	partialdir=$(dirname $filepath)
	while [[ $partialdir != "." ]]; do
	echo "partialdir: $partialdir"
		rmdir $partialdir
		partialdir=$(dirname $partialdir)
	done
}
