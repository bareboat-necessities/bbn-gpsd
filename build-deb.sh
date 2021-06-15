#!/bin/bash -e

apt-get update  -y -q
apt-get install -y -q wget xz-utils gnupg ca-certificates
apt-get upgrade -y -q

apt-get -y install devscripts build-essential lintian

apt-get -y install python3-all-dev python3-all-dbg xsltproc docbook-xsl \
  docbook-xml libncurses-dev libdbus-glib-1-dev makedev python3-matplotlib \
  python3-gps qtbase5-dev scons dh-buildinfo dh-apparmor dh-exec pps-tools \
  asciidoc asciidoctor libsystemd-dev \
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

