#!/bin/bash
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
yum install cloud-utils-growpart -y
growpart /dev/sda 1
xfs_growfs / -d
yum install -y https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
yum --enablerepo elrepo-kernel install kernel-ml kernel-ml-headers kernel-ml-devel -y
grub2-set-default 0