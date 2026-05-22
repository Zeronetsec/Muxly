# https://github.com/Zeronetsec/Muxly

function include() {
    local input_data
    local line

    if [[ "${1}" != ":" ]]; then
        return 1
    fi

    shift
    input_data="${1}"

    if [[ -z "${input_data}" ]]; then
        return 1
    fi

    input_data="$(echo -e "${input_data}" | \
        command sed -n '/(/,/)/p' | \
        command sed 's/[()]//g' | \
        command sed 's/^[[:space:]]*[[:space:]]*//; s/^[[:space:]]*//; s/[[:space:]]*$//' | \
        command sed '/^$/d'
    )"

    while read -r line; do
        [[ -z "${line}" ]] && continue
        [[ "${line}" =~ ^# ]] && continue
        if [[ ! -f "${muxlyroot}/${line}.sh" ]]; then
            echo -e "\033[1;31m[!] \033[0mInclude: \033[0;32m${line} \033[0mnot found!"
            return 1
        fi
        source "${muxlyroot}/${line}.sh"
    done <<< "${input_data}"

    return 0
}

readonly -f include

# Copyright (c) 2026 Zeronetsec