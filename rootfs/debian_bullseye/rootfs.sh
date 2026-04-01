#!/usr/bin/env bash
# Muxly Project

command apt update -y
export DEBIAN_FRONTEND=noninteractive
command apt \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    full-upgrade -y

command cat > "/etc/apt/sources.list" << '__INJECT__'
deb http://deb.debian.org/debian bullseye main contrib non-free
deb http://security.debian.org/debian-security bullseye-security main contrib non-free
deb http://deb.debian.org/debian bullseye-updates main contrib non-free
__INJECT__

command apt update -y
export DEBIAN_FRONTEND=noninteractive
command apt \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    full-upgrade \
    --allow-downgrades -y

command cat > "${HOME}/.bashrc" << '__INJECT__'
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export LS_OPTIONS='--color=always'
export PROMPT_DIRTRIM=2

eval "$(command dircolors --sh)"

alias ls='ls $LS_OPTIONS'
alias ll='ls -lah --color=always'
alias l='ls -CF --color=always'
alias la='ls -a --color=always'
alias lsa='ls -la --color=always'
alias lsr='ls -Ra --color=always'
alias lst='tree -CaL 1'
alias dir='dir --color=always'
alias vdir='vdir --color=always'
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias rg='command rg --color=always'

export PS1='\[\033[1;34m\]\u@\h\[\033[0m\]:\[\033[1;31m\]\w \[\033[0m\]\$ '
__INJECT__

# Copyright (c) 2026 Zeronetsec