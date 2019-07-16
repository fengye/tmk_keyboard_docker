#!/bin/bash
if [ -z "$1" ]; then
	echo Please specify the launching image name.
	exit 1
fi

if [ -z "$2" ]; then
	echo Please specify your keyboard name.
	exit 1
fi


docker run --rm -v $(pwd):/project $1 /bin/bash /project/container_scripts/build_then_flash_firmware.sh $2 $3