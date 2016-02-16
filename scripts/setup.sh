#!/bin/bash 

set -ex

if [ `whoami` != 'root' ]; then
  echo $0 must be run as root.
  exit 1
fi

HOSTNAME='console-remote'

hostnamectl set-hostname "$HOSTNAME"

cat << EOF >> /etc/hosts
127.0.0.1 $HOSTNAME localhost
::1   localhost6.localdomain6 localhost6

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
EOF

echo "$HOSTNAME" >| /etc/hostname

snappy update ubuntu-core
reboot
