#!/bin/bash -e

CONTAINER_DISTRO=$1

apt-get update  -y -q
apt-get install -y -q wget xz-utils gnupg ca-certificates
apt-get upgrade -y -q

BACKPORT=
if [ "$CONTAINER_DISTRO" == "debian:buster" ]; then
  BACKPORT=/buster-backports
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 04EE7237B7D453EC 648ACFD622F3D138 # debian backports
  echo "deb http://deb.debian.org/debian buster-backports main" > /etc/apt/sources.list.d/debian-backports.list
  apt-get update  -y -q
fi

apt-get -y install devscripts build-essential lintian

apt-get -y install python3-all-dev python3-all-dbg xsltproc docbook-xsl \
  docbook-xml libncurses-dev libdbus-glib-1-dev makedev python3-matplotlib \
  python3-gps"$BACKPORT" qtbase5-dev scons dh-buildinfo dh-apparmor dh-exec pps-tools \
  asciidoc asciidoctor libsystemd-dev libdbus-1-dev \
  libusb-1.0-0-dev libbluetooth-dev python3-gi python3-cairo gir1.2-gtk-3.0 \
  python3-serial python3-gi-cairo bc dh-python libudev-dev

wget http://deb.debian.org/debian/pool/main/g/gpsd/gpsd_3.22-3.debian.tar.xz
wget http://deb.debian.org/debian/pool/main/g/gpsd/gpsd_3.22.orig.tar.xz

xzcat gpsd_3.22.orig.tar.xz | tar xvf -

cd gpsd-3.22/

xzcat ../gpsd_3.22-3.debian.tar.xz | tar xvf -

debuild -us -uc

cd ..

rm ./*dbgsym*.deb

