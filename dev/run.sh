#!/bin/bash

sudo docker ps --filter name=hehaoqian_dev -q | xargs sudo docker stop 2>/dev/null
sleep 1

sudo docker run \
--name hehaoqian_dev \
-d --rm \
--network host \
--mount type=bind,src=$HOME/.ssh,dst=/home/main/.ssh,ro \
--mount type=bind,src=$HOME/.gitconfig,dst=/home/main/.gitconfig,ro \
--mount type=bind,src=$HOME/.gnupg,dst=/home/main/.gnupg \
--mount type=bind,src=$HOME/.local/bin,dst=/home/main/.local/bin,ro \
--mount type=bind,src=/home/main/code,dst=/home/main/code \
hehaoqian/dev:latest
