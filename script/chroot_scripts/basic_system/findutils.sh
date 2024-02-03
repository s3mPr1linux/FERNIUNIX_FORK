#!/bin/bash

SRC_COMPRESSED_FILE=findutils-4.9.0.tar.xz
SRC_FOLDER=findutils-4.9.0

build_source_package(){
    ./configure --prefix=/usr --localstatedir=/var/lib/locate
    make $MAKEFLAGS
    make install
}

