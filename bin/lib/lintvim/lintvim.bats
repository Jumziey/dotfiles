#!/usr/bin/env bats

source lintvim.sh

@test "lintvim with well defined files should return 0" {
	lintvim ./vimfilesgood
}

@test "lintvim with badly defined files should return nonzero" {
	! lintvim ./vimfilesbad
}

@test "lintvim should ignore files without the '.vim' file ending" {
	lintvim ./vimfilesignore
}
