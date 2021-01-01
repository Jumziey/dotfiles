#!/usr/bin/env bash


#Takes a file path as only argument, relative or absolute
#returns the absolute path to the folder the file path in
fileroot() {
	cd "$(dirname "$1")" >/dev/null 2>&1 && pwd
}

