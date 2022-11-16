#!/bin/bash

set -e
set -u
set -o pipefail

if [[ ! -f /etc/debian_version ]]; then
  echo "minideb can currently only be built on debian based distros, aborting..."
  exit 1
fi

apt-get update
apt-get install -y debian-archive-keyring jq dpkg-dev gnupg apt-transport-https ca-certificates curl gpg wget
wget http://ftp.us.debian.org/debian/pool/main/d/debootstrap/debootstrap_1.0.128+nmu2_all.deb
apt install -y ./debootstrap*

