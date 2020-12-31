#!/usr/bin/env bats

source unique.sh

@test "consecutive unique-prefixes are unique" {
	VALUE="test"
	V1=$(unique-postfix "$VALUE")
	V2=$(unique-postfix "$VALUE")
	! [[ "$V1" == "$V2" ]]
}
