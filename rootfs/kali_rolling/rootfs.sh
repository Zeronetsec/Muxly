#!/usr/bin/env bash
# https://github.com/Zeronetsec/Muxly

set -o errexit

command apt update -y
export DEBIAN_FRONTEND=noninteractive
command apt \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    full-upgrade -y

command apt install -y \
    curl \
    gnupg

command curl -fsSL \
    "https://archive.kali.org/archive-key.asc" | \
    command gpg --dearmor -o "/etc/apt/trusted.gpg.d/kali.gpg"

echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware' \
    > "/etc/apt/sources.list"

command mkdir -pv "/etc/apt/preferences.d"
echo 'Package: *\nPin: release o=Kali\nPin-Priority: 1001' \
    > "/etc/apt/preferences.d/kali"

command apt update -y
export DEBIAN_FRONTEND=noninteractive
command apt \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    full-upgrade \
    --allow-downgrades -y

command cat > "${HOME}/.bashrc" << '__INJECT__'
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export LS_OPTIONS='--color=always'
export PROMPT_DIRTRIM=2
export PROOT_NO_SECCOMPT=1

eval "$(command dircolors --sh)"

alias ls='command ls $LS_OPTIONS'
alias ll='command ls -lah --color=always'
alias l='command ls -CF --color=always'
alias la='command ls -a --color=always'
alias lsa='command ls -la --color=always'
alias lsr='command ls -Ra --color=always'
alias lst='command tree -CaL 1'
alias dir='command dir --color=always'
alias vdir='command vdir --color=always'
alias grep='command grep --color=always'
alias fgrep='command fgrep --color=always'
alias egrep='command egrep --color=always'
alias rg='command rg --color=always'

export PS1='\[\033[0m\]\n\[\033[1;34m\]┌──(\[\033[1;31m\]\u㉿\h\[\033[1;34m\])-[\[\033[0m\]\w\[\033[1;34m\]]\n\[\033[1;34m\]└──\[\033[1;31m\]\$\[\033[0m\] '
__INJECT__

exit 0

# Copyright (c) 2026 Zeronetsec