#!/bin/bash

service ssh start

mkdir -p /root/.ssh
if [[ -e /home/main/.ssh/authorized_keys ]]; then
  cp /home/main/.ssh/authorized_keys /root/.ssh/
fi

sleep infinity
