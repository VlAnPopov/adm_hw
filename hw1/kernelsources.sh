#!/bin/bash
[[ $(id -u) -ne 0 ]] && { echo "Перезапустите скрипт от имени администратора" >&2; exit 1; }
yum groupinstall "Development Tools" -y
yum install ncurses-devel openssl-devel bc python3 cmake perl -y
yum update -y
mkdir /home/vagrant/dw
cd /home/vagrant/dw
git clone https://github.com/acmel/dwarves.git
cd dwarves
mkdir build
cd build
cmake -D__LIB=lib -DCMAKE_INSTALL_PREFIX=/usr ..
make install
ldconfig
cd /home/vagrant
curl -O -L  https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.7.9.tar.xz
tar -xvf linux-6.7.9.tar.xz -C /usr/src
cd /usr/src/linux-6.7.9/
yes "" | make oldconfig
make menuconfig
make