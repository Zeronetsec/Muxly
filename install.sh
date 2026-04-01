#!/usr/bin/env bash
# Muxly Project

N='\033[0m'
R='\033[1;31m'
B='\033[1;34m'
GG='\033[0;32m'
DG='\033[1;90m'

base="$PREFIX/opt"
symlink="$PREFIX/bin"
bkdate="$(command date +%Y_%b_%d_%H_%M_%S)"

path="$(
    cd -- "$(
        command dirname -- "${BASH_SOURCE[0]}"
    )" &> /dev/null && pwd
)"

if [[ "$1" == "--backup" ]]; then
    backup="true"
fi

function install() {
    local cmd="$1"
    local desc="$2"
    echo -e "\n${B}[*] ${N}${desc}"
    eval "${cmd}" >/dev/null
    local status=$?
    echo -e "    ${DG}└── ${N}exit: ${GG}${status}${N}"
}

if [[ ! -d "$path" ]]; then
    echo -e "\n${R}[!] ${N}Folder: ${GG}${path} ${N}not found! \n"
    exit 1
fi

pack=(
    "bash"
    "zip"
    "proot-distro"
    "coreutils"
    "gawk"
    "grep"
)

for i in "${pack[@]}"; do
    install \
        "command apt install -y ${i}" \
        "Installing: ${GG}${i}${N}" 2>/dev/null
done

if [[ ! -d "$base" ]]; then
    install \
        "command mkdir -p ${base}" \
        "Create directory: ${GG}${base}${N}"
fi


if [[ "$backup" == "true" && -d "$base/muxly" ]]; then
    cd "$base"
    install \
        "command zip -r muxly_${bkdate}.bak.zip muxly" \
        "Backup: ${GG}${base}/muxly ${DG}=> ${GG}${base}/muxly_${bkdate}.bak.zip${N}"
    cd
fi

tprop="$HOME/.termux/termux.properties"
tfont="$HOME/.termux/font.ttf"
tth="$HOME/.termux/colors.properties"
rfs="$PREFIX/var/lib/proot-distro/installed-rootfs"

if [[ "$backup" == "true" ]]; then
    if [[ -f "$tprop" || -L "$tprop" ]]; then
        install \
            "command cp ${tprop} ${tprop}_${bkdate}.bak" \
            "Backup: ${GG}${tprop} ${DG}=> ${GG}${tprop}_${bkdate}.bak${N}"
    fi

    if [[ -f "$tfont" || -L "$tfont" ]]; then
        install \
            "command cp ${tfont} ${tfont}_${bkdate}.bak" \
            "Backup: ${GG}${tfont} ${DG}=> ${GG}${tfont}_${bkdate}.bak${N}"
    fi

    if [[ -f "$tth" || -L "$tth" ]]; then
        install \
            "command cp ${tth} ${tth}_${bkdate}.bak" \
            "Backup: ${GG}${tth} ${DG}=> ${GG}${tth}_${bkdate}.bak${N}"
    fi

    if [[ -d "$rfs" ]]; then
        shopt -s nullglob
        bk=("$rfs"/*)
        shopt -u nullglob

        if [[ "${#bk[@]}" -gt 0 ]]; then
            for i in "${bk[@]}"; do
                dsname="${i##*/}"
                install \
                    "command proot-distro backup ${dsname}" \
                    "Backup: ${GG}${dsname}${N}" 2>/dev/null
            done
        fi
    fi
fi

if [[ -d "$base/muxly" ]]; then
    if [[ -f "$base/muxly/config/config.conf" ]]; then
        install \
            "command cat ${base}/muxly/config/config.conf > ${path}/config/config.conf" \
            "Sync: ${GG}${base}/muxly/config/config.conf ${DG}=> ${GG}${path}/config/config.conf${N}"
    fi

    install \
        "command rm -rf ${base}/muxly" \
        "Removing: ${GG}old muxly${N}"
fi

install \
    "command mv ${path} ${base}/muxly" \
    "Moving: ${GG}${path} ${DG}=> ${GG}${base}/muxly${N}"

install \
    "command chmod +x -R ${base}/muxly" \
    "Setting up permissions"

install \
    "command ln -sf ${base}/muxly/muxly.sh ${symlink}/muxly" \
    "Symlink: ${GG}${base}/muxly/muxly.sh ${DG}=> ${GG}${symlink}/muxly${N}"

printf '\n'
if command -v muxly &>/dev/null; then
    echo -e "${GG}[+] ${N}Muxly installed!"
    echo -e "${GG}[+] ${N}Usage: ${GG}muxly --help ${N}to show helper"
    printf '\n'
    exit 0
else
    echo -e "${R}[!] ${N}Failed installing muxly!"
    printf '\n'
    exit 1
fi

# Copyright (c) 2026 Zeronetsec