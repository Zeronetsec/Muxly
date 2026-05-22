# https://github.com/Zeronetsec/Muxly

function utils::general::Help() {
    export metadata="${muxlyroot}/metadata"
    local engine="${muxlyroot}/utils/json_parser.py"

    if [[ -f "${engine}" ]]; then
        utils::birthday
        echo -e "${N}Usage: ${GG}muxly ${CC}<command> [<args>]${N}"
        printf '\n'

        [[ ! -x "${engine}" ]] && {
            command chmod +x "${engine}"
        }

        command python3 "${engine}"
        return $?
    else
        echo -e "${R}[!] ${N}Engine: ${GG}${engine} ${N}not found!"
        return 1
    fi

    return 0
}

# Copyright (c) 2026 Zeronetsec