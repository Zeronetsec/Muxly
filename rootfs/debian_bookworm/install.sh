#!/usr/bin/env bash
# Muxly Project

distro="debian_bookworm"
base="debian"

if [[ -d "$rfspath/$base" ]]; then
    command proot-distro remove "${base}"
fi

command proot-distro install "${base}"
command proot-distro rename "${base}" "${distro}"

if [[ -f "$rfspath/$distro/rootfs.sh" ]]; then
    command rm -fv "${rfspath}/${distro}/rootfs.sh"
fi

command cp -v \
    "${muxlyroot}/rootfs/${distro}/rootfs.sh" \
    "${rfspath}/${distro}/rootfs.sh"

command chmod -v +x "${rfspath}/${distro}/rootfs.sh"
command proot-distro login "${distro}" -- bash '/rootfs.sh'
command rm -fv "${rfspath}/${distro}/rootfs.sh"

echo -e "${B}[*] ${N}Rootfs: ${GG}${distro} ${N}successfully installed"
exit 0

# Copyright (c) 2026 Zeronetsec