#!/bin/bash
[[ $(id -u) -ne 0 ]] && { echo "Перезапустите скрипт от имени администратора" >&2; exit 1; }
yum groupinstall "Development Tools" -y
yum install ncurses-devel openssl-devel bc python3 perl -y
yum update -y
cd /usr/src
GCC_VERSION=13.2.0
curl -O -L  https://ftp.gnu.org/gnu/gcc/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.gz
tar xzvf gcc-${GCC_VERSION}.tar.gz
mkdir obj.gcc-${GCC_VERSION}
cd gcc-${GCC_VERSION}
./contrib/download_prerequisites
cd ../obj.gcc-${GCC_VERSION}
../gcc-${GCC_VERSION}/configure --disable-multilib --enable-languages=c,c++
make -j $(nproc)
make install