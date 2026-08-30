#!/usr/bin/env bash
# https://github.com/Zeronetsec/Muxly

set -o errexit

distro="debian_bullseye"
install="debian:11"
fullpath="${rfspath}/${distro}/rootfs/rootfs.sh"

command pd530 install "${install}" --name "${distro}"
if [[ -f "${fullpath}" ]]; then
    command rm -fv "${fullpath}"
fi

command cp -v \
    "${root}/rootfs/${distro}/rootfs.sh" \
    "${fullpath}"

command chmod -v +x "${fullpath}"
command pd530 login "${distro}" -- bash '/rootfs.sh'
command rm -fv "${fullpath}"

echo -e "\x1b[1;34m[*] \x1b[0mRootfs: \x1b[0;32m${distro} \x1b[0msuccessfully installed"

# Copyright (c) 2026 Zeronetsec