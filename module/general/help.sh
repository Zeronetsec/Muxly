# https://github.com/Zeronetsec/Muxly

function module::general::Help() {
    export metadata="${root}/metadata"
    local engine="${root}/utils/python/json_parser.py"

    if [[ -f "${engine}" ]]; then
        utils::banner
        utils::birthday

        echo -e "${N}Usage: ${GG}muxly ${CC}<option> [<args>]${N}"
        printf '\n'

        [[ ! -x "${engine}" ]] && {
            command chmod +x "${engine}"
        }

        command python3 "${engine}"
        return ${?}
    else
        echo -e "${R}[!] ${N}Engine: ${GG}${engine} ${N}not found!"
        return 1
    fi

    return 0
}; readonly -f module::general::Help

# Copyright (c) 2026 Zeronetsec