#!/bin/bash
pushd /project/tmk_keyboard/keyboard/$1
if [ -z "$1" ]; then
	echo Please specify the keyboard name
	exit 1
fi

if [ -z "$2" ]; then
	echo Use default variant
	if [ -z "$3" ]; then
		echo Use defualt keymap
		make -f Makefile.unimap clean
		make -f Makefile.unimap
	else
		echo Use keymap $3
		make -f Makefile.unimap KEYMAP=$3 clean
		make -f Makefile.unimap KEYMAP=$3
	fi
else
	echo Use variant $2
	if [ -z "$3" ]; then
		echo Use defualt keymap
		make -f Makefile.unimap.$2 clean
		make -f Makefile.unimap.$2
	else
		echo Use keymap $3
		make -f Makefile.unimap.$2 KEYMAP=$3 clean
		make -f Makefile.unimap.$2 KEYMAP=$3
	fi
fi
if [ $? -eq 0 ]; then
  echo '1) Check the built .hex file in ./tmk_keyboard/keyboard/<your_keyboard>/ and '
  echo '2) Push the program button on the controler PCB. '
  echo '3) Then,'
  echo '$ dfu-programmer atmega32u4 erase --force'
  echo '$ dfu-programmer atmega32u4 flash <your_hex_file.hex>'
  echo '$ dfu-programmer atmega32u4 launch'
else
  echo Compilation failed. No .hex file is produced.
fi
popd
