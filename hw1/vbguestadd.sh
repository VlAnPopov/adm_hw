#!/bin/bash
# запуск от sudo
[[ $(id -u) -ne 0 ]] && { echo "Перезапустите скрипт от имени администратора" >&2; exit 1; }
cd /home/vagrant
curl -O -L http://download.virtualbox.org/virtualbox/7.0.14/VBoxGuestAdditions_7.0.14.iso
mkdir /media/VBoxGuestAdditions
mount -o loop,ro VBoxGuestAdditions_7.0.14.iso /media/VBoxGuestAdditions
sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
