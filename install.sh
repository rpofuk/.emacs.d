#!/bin/bash

set -e 

workdir="$(mktemp -d)"
echo "Workdir $workdir"

cd $workdir

git clone --depth 1 https://github.com/emacs-mirror/emacs.git
cd emacs

apt-get update
apt-get install -y build-essential libgccjit-10-dev

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
	--with-json \
	  CFLAGS="-O4 -mtune=native -march=native -fomit-frame-pointer"

make -j6

make install

