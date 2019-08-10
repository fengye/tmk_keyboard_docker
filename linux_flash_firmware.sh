#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

MCU='atmega32u4'

if [ -z "$1" ]; then
	echo Please specify your keyboard name.
	exit 1
fi

until dfu-programmer $MCU get bootloader-version; do
	echo "Waiting for deivce, push the program button..."
	sleep 1
done

dfu-programmer $MCU erase --suppress-validation
sleep 0.5
if [ -z "$2" ]; then
	dfu-programmer $MCU flash ./tmk_keyboard/keyboard/$1/$1_unimap.hex
else
	dfu-programmer $MCU flash ./tmk_keyboard/keyboard/$1/$1_$2_unimap.hex
fi

sleep 0.5
dfu-programmer $MCU start
