#!/usr/bin/env bats

source backup.sh

@test "addition using bc" {
  result="$(echo 2+2 | bc)"
  [ "$result" -eq 4 ]
}


@test "ignored ignores names in ignore array" {
	ignores=(
	one
	two
	three
	four
	)
	ignored "${ignores[2]}" "${ignores[@]}"
}

@test "ignored does not ignore names in not in ignore array" {
	ignores=(
	one
	two
	three
	four
	)
	does_not_exists="aoeuhtnsaoeuhtnsaoeu"
	! ignored "$does_not_exists" "${ignores[@]}"
}

@test "backup moves test_file to backup" {
	test_file="backup/this/test_file-$(date +%N).txt"
	backup_root="$BATS_TMPDIR/backup-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	mkdir -p "$(dirname "$test_host_root"/"$test_file")"
	touch "$test_host_root/$test_file"

	backup "$backup_root" "$test_host_root" "$test_file"
	echo "does this exist?: $backup_root/$test_file"
	[ -f "$backup_root/$test_file" ]; 
}

@test "backup ignores non existing test_files" {
	test_file="backup/this/test_file-$(date +%N).txt"
	backup_root="$BATS_TMPDIR/backup-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	mkdir -p "$(dirname "$test_host_root"/"$test_file")"

	backup "$backup_root" "$test_host_root" "$test_file"
	! [ -f "$backup_root/$test_file" ]
}

@test "backup removes test_file after backup" {
	test_file="backup/this/test_file-$(date +%N).txt"
	backup_root="$BATS_TMPDIR/backup-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	mkdir -p "$(dirname "$test_host_root"/"$test_file")"
	touch "$test_host_root/$test_file"

	backup "$backup_root" "$test_host_root" "$test_file"
	! [ -f "$test_host_root/$test_file" ]
}

@test "backup does not backup if test_file is symlink" {
	test_file="backup/this/test_file-$(date +%N).txt"
	backup_root="$BATS_TMPDIR/backup-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	mkdir -p "$(dirname "$test_host_root"/"$test_file")"
	link_test_file=$BATS_TMPDIR/link-test_file.txt
	ln -sfn "$link_test_file" "$test_host_root"/"$test_file"

	backup "$backup_root" "$test_host_root" "$test_file"
	! [ -f "$backup_root/$test_file" ]
}

@test "backup removes test_file if its a symlink" {
	test_file="backup/this/test_file-$(date +%N).txt"
	backup_root="$BATS_TMPDIR/backup-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	mkdir -p "$(dirname "$test_host_root"/"$test_file")"

	link_test_file=$BATS_TMPDIR/link-test_file.txt
	ln -sfn "$link_test_file" "$test_host_root"/"$test_file"

	backup "$backup_root" "$test_host_root" "$test_file"
	! [ -f "$test_host_root/$test_file" ]
}

@test "link_dottest_file links the test_file" {
	test_script_root="$BATS_TMPDIR/script-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	test_file="backup/this/test_file-$(date +%N).txt"

	test_fileContent="cool content"
	mkdir -p "$(dirname "$test_script_root/$test_file")"
	echo "$test_fileContent" >"$test_script_root"/"$test_file"


	link_dotfile "$test_script_root" "$test_host_root" "$test_file"
	linkedFileContent="$(<"$test_host_root"/"$test_file")"
	echo "linkedtest_filecontent: $linkedFileContent"
	echo "test_fileContent: $test_fileContent"
	[ "$test_fileContent" = "$linkedFileContent" ]
}

@test "link_dottest_file complains if the target does not exists" {
	test_script_root="$BATS_TMPDIR/script-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	test_file="backup/this/test_file-$(date +%N).txt"

	run link_dotfile "$test_script_root" "$test_host_root" "$test_file"
	echo "output: $output"
	echo "constructed: $test_script_root/$test_file not found"
	[ "$output" = "$test_script_root/$test_file not found" ]
}
