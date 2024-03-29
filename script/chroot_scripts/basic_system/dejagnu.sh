#!/bin/bash

SRC_COMPRESSED_FILE=dejagnu-1.6.3.tar.gz
SRC_FOLDER=dejagnu-1.6.3

build_source_package(){
    mkdir -v build
    cd build
    ../configure --prefix=/usr
    makeinfo --html --no-split -o doc/dejagnu.html ../doc/dejagnu.texi
    makeinfo --plaintext    -o doc/dejagnu.txt ../doc/dejagnu.texi

    make install
    install -v -dm755  /usr/share/doc/dejagnu-1.6.3
    install -v -m644   doc/dejagnu.{html,txt} /usr/share/doc/dejagnu-1.6.3
}

