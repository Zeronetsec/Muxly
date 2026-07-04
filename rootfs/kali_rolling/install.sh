#!/usr/bin/env bash
# https://github.com/Zeronetsec/Muxly

set -o errexit

distro="kali_rolling"
install="debian:latest"
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

echo -e "${B}[*] ${N}Rootfs: ${GG}${distro} ${N}successfully installed"
exit 0

# Copyright (c) 2026 Zeronetsec