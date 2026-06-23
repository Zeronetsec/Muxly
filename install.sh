#!/usr/bin/env bash

set -o errexit

src="${BASH_SOURCE[0]}"
while [[ -h "${src}" ]]; do
    dir="$(
        cd -P "$(
            command dirname "${src}"
        )" > /dev/null 2>&1 && pwd
    )"
    src="$(command readlink "${src}")"
    [[ "${src}" != /* ]] && src="${dir}/${src}"
done

dir="$(
    cd -P "$(
        command dirname "${src}"
    )" > /dev/null 2>&1 && pwd
)"

export root="${dir}"
readonly root

source "${root}/.install/include.sh"
include : '(
    .install/color
    .install/variable
    .install/error
    .install/varlock
    .install/zinstall
    .install/zparser
    .install/inpackages
    .install/prepdir
    .install/getinstall
    .install/installer
    .install/checker
    .install/extern/android_check
    .install/extern/pip_inpackages
    .install/fnclock
)'

__BACKUP__=false

while [[ ${#} -gt 0 ]]; do
    case "${1}" in
        "--backup") export __BACKUP__=true ;;
    esac
    shift
done

install::extern::androidCheck
install::inpackages
install::extern::pipInpackages
install::prepdir
install::installer
install::checker

trap - EXIT
exit ${?}