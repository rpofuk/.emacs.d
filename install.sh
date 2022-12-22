#!/bin/bash

set -e 

workdir="$(mktemp -d)"
echo "Workdir $workdir"

cd $workdir

git clone --depth 1 https://github.com/emacs-mirror/emacs.git
cd emacs

apt-get update

debconf-set-selections <<< "postfix postfix/mailname string $HOSTNAME"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"


apt-get install -y build-essential libgccjit-11-dev

apt-get build-dep -y emacs 

./autogen.sh
./configure  \
	--with-dbus \
	--with-gif \
	--with-jpeg \
	--with-png \
	--with-rsvg \
	--with-tiff \
	--with-xft \
	--with-xpm \
	--with-gpm=no \
	--with-modules \
	--with-pgtk \
	--with-native-compilation \
	--with-json \
	  CFLAGS="-O4 -mtune=native -march=native -fomit-frame-pointer"

make uninstall

make -j6

make install

