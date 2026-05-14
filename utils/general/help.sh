# https://github.com/Zeronetsec/Muxly

function __help__() {
    local metadata="${muxlyroot}/metadata"

    __birthday__
    echo -e "${N}Usage: ${GG}muxly ${CC}<command> [<args>]${N}"
    printf '\n'

    idx=0
    shopt -s nullglob

    for dir in "${metadata}/"*/; do
        [[ "${idx}" -ne 0 ]] && printf '\n'

        section="$(command basename "${dir}")"
        echo -e "${N}${section^} commands:"

        for file in "${dir}"/*.json; do
            command="$(command jq -r '.Command' "${file}")"
            args="$(command jq -r '.Args' "${file}")"
            desc="$(command jq -r '.Description' "${file}")"

            if [[ -n "${args}" ]]; then
                fullcmd="${GG}${command} ${CC}${args}${N}"
            else
                fullcmd="${GG}${command}${N}"
            fi

            echo -e "    ${R}› ${fullcmd} ${DG}- ${WW}${desc}${N}"
        done
        ((idx++))
    done

    shopt -u nullglob
}

# Copyright (c) 2026 Zeronetsec