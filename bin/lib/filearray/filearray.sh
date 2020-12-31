#!/usr/bin/env bash

filearray() {
	local -n array=$3
  # shellcheck disable=SC2034
	mapfile -d $'\0' array < <(find "$1" -name "$2" -type f -print0)
}
