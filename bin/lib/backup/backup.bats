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

# @test "exists_in_root finds test_file" {
# 	root_dir="$BATS_TMPDIR"
# 	test_file="test/folder/test_file.txt"
# 	mkdir -p $(dirname "$root_dir/$test_file")
# 	touch "$root_dir/$test_file"
# 
# 	exists_in_root $root_dir $test_file
# }
# 
# @test "exists_in_root does not give false positives" {
# 	root_dir="$BATS_TMPDIR"
# 	test_file="test/folder/test_file.txt"
# 	mkdir -p $(dirname "$root_dir/$test_file")
# 	touch "$root_dir/$test_file"
# 
# 	! exists_in_root $root_dir "/a/non/existing/test_file.txt"
# }

@test "backup moves test_file to backup" {
	test_file="backup/this/test_file-$(date +%N).txt"
	backup_root="$BATS_TMPDIR/backup-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	mkdir -p "$(dirname $test_host_root/$test_file)"
	touch "$test_host_root/$test_file"

	backup $backup_root $test_host_root $test_file
	echo "does this exist?: "$backup_root/$test_file""
	[ -f "$backup_root/$test_file" ]; 
}

@test "backup ignores non existing test_files" {
	test_file="backup/this/test_file-$(date +%N).txt"
	backup_root="$BATS_TMPDIR/backup-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	mkdir -p "$(dirname $test_host_root/$test_file)"

	backup $backup_root $test_host_root $test_file
	! [ -f "$backup_root/$test_file" ]
}

@test "backup removes test_file after backup" {
	test_file="backup/this/test_file-$(date +%N).txt"
	backup_root="$BATS_TMPDIR/backup-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	mkdir -p "$(dirname $test_host_root/$test_file)"
	touch "$test_host_root/$test_file"

	backup $backup_root $test_host_root $test_file
	! [ -f "$test_host_root/$test_file" ]
}

@test "backup does not backup if test_file is symlink" {
	test_file="backup/this/test_file-$(date +%N).txt"
	backup_root="$BATS_TMPDIR/backup-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	mkdir -p "$(dirname $test_host_root/$test_file)"
	link_test_file=$BATS_TMPDIR/link-test_file.txt
	ln -sfn $link_test_file "$test_host_root/$test_file"

	backup $backup_root $test_host_root $test_file
	! [ -f "$backup_root/$test_file" ]
}

@test "backup removes test_file if its a symlink" {
	test_file="backup/this/test_file-$(date +%N).txt"
	backup_root="$BATS_TMPDIR/backup-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	mkdir -p "$(dirname $test_host_root/$test_file)"

	link_test_file=$BATS_TMPDIR/link-test_file.txt
	ln -sfn $link_test_file "$test_host_root/$test_file"

	backup $backup_root $test_host_root $test_file
	! [ -f "$test_host_root/$test_file" ]
}

@test "link_dottest_file links the test_file" {
	test_script_root="$BATS_TMPDIR/script-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	test_file="backup/this/test_file-$(date +%N).txt"

	test_fileContent="cool content"
	mkdir -p "$(dirname "$test_script_root/$test_file")"
	echo $test_fileContent >"$test_script_root/$test_file"


	link_dotfile $test_script_root $test_host_root $test_file
	linkedFileContent="$(<$test_host_root/$test_file)"
	echo "linkedtest_filecontent: $linkedFileContent"
	echo "test_fileContent: $test_fileContent"
	[ "$test_fileContent" = "$linkedFileContent" ]
}

@test "link_dottest_file complains if the target does not exists" {
	test_script_root="$BATS_TMPDIR/script-$(date +%N)"
	test_host_root="$BATS_TMPDIR/host-$(date +%N)"
	test_file="backup/this/test_file-$(date +%N).txt"

	run link_dotfile $test_script_root $test_host_root $test_file
	echo "output: $output"
	echo "constructed: $test_script_root/$test_file not found"
	[ "$output" = "$test_script_root/$test_file not found" ]
}

@test "create_backup_root creates backup_root in empty root" {
	test_root="$BATS_TMPDIR/root-$(date +%N)"
	test_backup_root="$test_root/backup_folder_name"
	create_backup_root $test_backup_root
	echo "checking: $test_backup_root"
	[ -d "$test_backup_root" ]
}

@test "create_backup_root backs up old backup if one already exists " {
	test_root="$BATS_TMPDIR/root-$(date +%N)"
	test_backup_root="$test_root/backup"
	create_backup_root $test_backup_root
	create_backup_root $test_backup_root
	folders_found="$(find $test_root -type d)"
	number_of_folders="$(find $test_root -type d | wc -l)"
	echo "folders found: $folders_found"
	echo "nr of folders: $number_of_folders"
	#counts the $test_root aswell, thus 3 instead of the
	#more intuitive 2
	#$test_root/
	#$test_root/backup
	#$test_root/backup-<some-date>
	[ $number_of_folders -eq 3 ] 
}
