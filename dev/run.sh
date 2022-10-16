#!/bin/bash

sudo docker run \
--name hehaoqian_dev \
-d --rm \
-p 192.168.50.12:60022:22 \
--mount type=bind,src=$HOME/.ssh,dst=/home/main/.ssh,ro \
--mount type=bind,src=$HOME/.gnupg,dst=/home/main/.gnupg,ro \
--mount type=bind,src=/home/main/code,dst=/home/main/code \
hehaoqian:dev
