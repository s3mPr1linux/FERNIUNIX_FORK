#!/bin/bash

SRC_COMPRESSED_FILE=coreutils-9.3.tar.xz
SRC_FOLDER=coreutils-9.3

build_source_package(){
    ./configure --prefix=/usr \
		--host=$LFS_TGT \
		--build=$(build-aux/config.guess) \
		--enable-install-program=hostname \
		--enable-no-install-program=kill,uptime \
		 gl_cv_macro_MB_CUR_MAX_good=y
    make $MAKEFLAGS
    make DESTDIR=$LFS install
    mv -v $LFS/usr/bin/chroot $LFS/usr/sbin
    mkdir -pv $LFS/usr/share/man/man8
    mv -v $LFS/usr/share/man/man1/chroot.1 $LFS/usr/share/man/man8/chroot.8
    sed -i 's/"1"/"8"/' $LFS/usr/share/man/man8/chroot.8
}
