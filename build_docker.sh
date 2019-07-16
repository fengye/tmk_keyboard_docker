#!/bin/bash
if [ -z "$1" ]; then
	echo Please specify the intended image name.
	exit 1
fi
git submodule update --init --recursive
docker build --tag $1 .
