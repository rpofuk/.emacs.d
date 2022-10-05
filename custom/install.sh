#!/bin/bash

./autogen.sh
./configure --with-json=yes --with-pgtk
make 
make install


# make uninstall
