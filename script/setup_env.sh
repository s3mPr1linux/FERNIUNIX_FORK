#!/bin/bash

set -e

. ./set_env_vars.sh

cd $WORK_DIR

if test -f "$VDISK_FILENAME"; then
    echo "$VDISK_FILENAME found"
    echo "mounting loop device"
    disk_loop=$(losetup --partscan --show --verbose --find $VDISK_FILENAME)
    echo "mounting root partition"
    mount -v -t ext4 "$disk_loop"p2 $PWD/$LFS_DIR
else
    echo "$VDISK_FILENAME not found"
fi