#!/usr/bin/env sh

setup-ntp -c chrony
setup-hostname
setup-timezone -z Europe/Paris
setup-apkrepos -f
setup-lbu -q
setup-apkcache /media/mmcblk0p1/cache


lbu commit -d

apk update
apk upgrade

adduser -S alex -h /home/alex -s /bin/ash -G wheel
echo -e "alex\nalex" | passwd alex

echo "/dev/mmcblk0p2 /home ext4 rw,relatime,user,nofail 0 0" >> /etc/fstab
mount -a
#mount /dev/mmcblk0p2 /home
mkdir /home/alex
chown -R alex:wheel /home/alex

#home_uuid=$(blkid -o value --uuid /dev/mmcblk0p2 | awk '{ print $2 }' | sed 's/^UUID="//' | sed 's/"$//')
#echo "UUID=$home_uuid       /home           ext4            rw,relatime     0 2" >> /etc/fstab

lbu commit -d

apk add rng-tools
rc-update add rngd boot
rc-update add urandom boot

lbu commit -d

apk add sudo
sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

lbu commit -d

mount -o remount,rw /media/mmcblk0p1
rm /media/mmcblk0p1/headless.apkovl.tar.gz
#rm /media/mmcblk0p1/wifi.txt

apk add python3

lbu commit -d
#reboot
