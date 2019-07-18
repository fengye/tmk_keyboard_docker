#!/bin/bash
# This won't work as host USB device won't be recognised by docker if docker is running on VM/HyperKit
# And only for atmega32u4 chips
pushd /project/tmk_keyboard/keyboard/$1
if [ -z "$1" ]; then
	echo Please specify the keyboard name
	exit 1
fi

if [ -z "$2" ]; then
	echo Use default variant
else
	echo Use variant $2
fi
echo Now press the program button on your $1 keyboard and wait...
sleep 5
dfu-programmer atmega32u4 erase --suppress-validation
if [ -z "$2" ]; then
	dfu-programmer atmega32u4 flash $1_unimap.hex
else
	dfu-programmer atmega32u4 flash $1_$2_unimap.hex
fi
dfu-programmer atmega32u4 start
popd