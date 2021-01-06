#!/usr/bin/env bash

log_success() {
	text="$1"
	echo -e "\e[32;1mSUCCESS: \e[0m${text}"
}

log_fail() {
	text="$1"
	echo -e "\e[31;1mFAIL: \e[0m${text}"
}

log_info() {
	text="$1"
	echo -e "\e[1;33;1mINFO: \e[0m${text}"

}
