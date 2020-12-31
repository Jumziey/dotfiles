#!/usr/bin/env bats

source filearray.sh

@test "filearray finds right amount of files" {
	filearray ./testfolder "*" testarray

	[[ ${#testarray[@]} -eq 5 ]]
}
