#!/bin/bash
if [ -z "$1" ]; then
	echo Please specify the launching image name.
	exit 1
fi

docker run --rm -it -v $(pwd):/project $1 /bin/bash