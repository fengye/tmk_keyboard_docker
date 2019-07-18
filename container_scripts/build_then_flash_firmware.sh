#/bin/bash
# This won't work as host USB device won't be recognised by docker if docker is running on VM/HyperKit
# $1 - keyboard name
# $2 - variant
# $3 - keymap
source /project/container_scripts/build_firmware.sh $1 $2 $3
source /project/container_scripts/flash_firmware.sh $1 $2