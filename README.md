# bbn-gpsd
GPSD

```

mkdir GPSD; cd GPSD

wget http://deb.debian.org/debian/pool/main/g/gpsd/gpsd_3.22-3.debian.tar.xz
wget http://deb.debian.org/debian/pool/main/g/gpsd/gpsd_3.22.orig.tar.xz

sudo apt-get -y install devscripts build-essential lintian

sudo apt-get -y install python3-all-dev python3-all-dbg xsltproc docbook-xsl \
  docbook-xml libncurses-dev libdbus-glib-1-dev makedev python3-matplotlib \
  python3-gps qtbase5-dev scons dh-buildinfo dh-apparmor dh-exec pps-tools \
  asciidoc asciidoctor libsystemd-dev

xzcat gpsd_3.22.orig.tar.xz | tar xvf -

cd gpsd-3.22/

xzcat ../gpsd_3.22-3.debian.tar.xz | tar xvf -

debuild -us -uc

cd ..

ls *.deb | grep -v dbgsym

cd ..

```
