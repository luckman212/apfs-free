#!/bin/zsh --no-rcs

if swiftc -O -o apfs_free apfs_free.swift; then
	cp -fv ./apfs_free /usr/local/bin
fi
