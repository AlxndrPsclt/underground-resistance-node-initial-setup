#!/bin/sh

curl -fsSL get.docker.com -o get-docker.sh
sed -i.bak s/"SUPPORT_MAP=\""/"SUPPORT_MAP=\"aarch64-raspbian-9"/g get-docker.sh
sudo sh get-docker.sh