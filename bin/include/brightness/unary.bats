source unary.sh 
#load bats-support/load
load bats-assert/load

@test "increment 1" {
	assert_equal $(increment 1) 10
}

@test "increment 20" {
	assert_equal $(increment 20) 30
}

@test "increment 100" {
	assert_equal $(increment 100) 100
}

@test "decrement 1" {
	assert_equal $(decrement 1) 1
}

@test "decrement 10" {
	assert_equal $(decrement 10) 1
}

@test "decrement 60" {
	assert_equal $(decrement 60) 50
}

@test "decrement 100" {
	assert_equal $(decrement 100) 90
}

@test "percentSign 1" {
	assert_equal $(percentSign 1) ""
}

@test "percentSign 10" {
	assert_equal $(percentSign 10) "%"
}

@test "percentSign 100" {
	assert_equal $(percentSign 100) "%"
}
