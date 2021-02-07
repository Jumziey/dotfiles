#!/usr/bin/env bash

unique-postfix() {
  echo "$1-$(date +%m-%d-%y-%N)"
}
