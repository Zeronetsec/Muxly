# https://github.com/Zeronetsec/Muxly

function utils::getconf() {
    [[ -z "${1}" ]] && return 1
    command cat "${config}" | \
    command grep "${1} = " | \
    command awk '{
        p = ""
        for (i = 3; i <= NF; i++) {
            p = p $i (i == NF ? "" : OFS)
        }
        print p
    }'
    return 0
}; readonly -f utils::getconf

# Copyright (c) 2026 Zeronetsec