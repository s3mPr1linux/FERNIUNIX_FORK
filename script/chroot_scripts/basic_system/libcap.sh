#!/bin/bash

SRC_COMPRESSED_FILE=libcap-2.67.tar.xz
SRC_FOLDER=libcap-2.67

build_source_package(){
    sed -i '/install -m.*STA/d' libcap/Makefile
    make $MAKEFLAGS prefix=/usr lib=lib
    make prefix=/usr lib=lib install
}

