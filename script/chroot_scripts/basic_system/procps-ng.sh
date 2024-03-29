#!/bin/bash

SRC_COMPRESSED_FILE=procps-ng-4.0.3.tar.xz
SRC_FOLDER=procps-ng-4.0.3

build_source_package(){
    ./configure --prefix=/usr                           \
		--docdir=/usr/share/doc/procps-ng-4.0.3 \
		--disable-static                        \
		--disable-kill                          \
		--with-systemd
    make $MAKEFLAGS
    make install
}

