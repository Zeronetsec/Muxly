#!/usr/bin/env bash
# https://github.com/Zeronetsec/Muxly

set -o errexit

distro="debian_trixie"
base="debian"
install="debian:13"
fullpath="${rfspath}/${distro}/rootfs/rootfs.sh"

if [[ -d "${rfspath}/${base}" ]]; then
    command proot-distro remove "${base}"
fi

command proot-distro install "${install}"
command proot-distro rename "${base}" "${distro}"

if [[ -f "${fullpath}" ]]; then
    command rm -fv "${fullpath}"
fi

command cp -v \
    "${muxlyroot}/rootfs/${distro}/rootfs.sh" \
    "${fullpath}"

command chmod -v +x "${fullpath}"
command proot-distro login "${distro}" -- bash '/rootfs.sh'
command rm -fv "${fullpath}"

echo -e "${B}[*] ${N}Rootfs: ${GG}${distro} ${N}successfully installed"
exit 0

# Copyright (c) 2026 Zeronetsec