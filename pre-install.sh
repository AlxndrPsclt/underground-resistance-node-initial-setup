#!/usr/bin/env sh

setup-ntp
setup-hostname
setup-timezone
setup-apkrepos
setup-lbu
setup-apkcache


lbu-commit -d

apk update

adduser alex


apk add rng-tools
rc-update add rngd boot
rc-update add urandom boot

mount -o remount,rw /media/mmcblk0p1
rm /media/mmcblk0p1/*.apkovl.tar.gz
#rm /media/mmcblk0p1/wifi.txt

lbu commit -d
#reboot
