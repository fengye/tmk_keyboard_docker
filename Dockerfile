FROM ubuntu:18.04
RUN apt-get update && apt-get install -y build-essential
RUN apt-get install -y gcc-avr avr-libc dfu-programmer
RUN mkdir -p /project/container_scripts
### ADD . /project
WORKDIR /project
