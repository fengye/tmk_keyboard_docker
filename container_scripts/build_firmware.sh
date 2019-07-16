#!/bin/bash
pushd /project/tmk_keyboard/keyboard/$1
if [ -z "$1" ]; then
	echo Please specify the keyboard name
	exit 1
fi

if [ -z "$2" ]; then
	echo Use default variant
	make
else
	echo Use variant $2
	make -f Makefile.$2
fi
popd
