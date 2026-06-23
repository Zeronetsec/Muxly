#!/usr/bin/env bash
# https://github.com/Zeronetsec/Muxly

set -o errexit

distro="ubuntu_latest"
base="ubuntu"
install="ubuntu"
fullpath="${rfspath}/${distro}/rootfs/rootfs.sh"

if [[ -d "${rfspath}/${base}" ]]; then
    command pd530 remove "${base}"
fi

command pd530 install "${install}"
command pd530 rename "${base}" "${distro}"

if [[ -f "${fullpath}" ]]; then
    command rm -fv "${fullpath}"
fi

command cp -v \
    "${root}/rootfs/${distro}/rootfs.sh" \
    "${fullpath}"

command chmod -v +x "${fullpath}"
command pd530 login "${distro}" -- bash '/rootfs.sh'
command rm -fv "${fullpath}"

echo -e "${B}[*] ${N}Rootfs: ${GG}${distro} ${N}successfully installed"
exit 0

# Copyright (c) 2026 Zeronetsec