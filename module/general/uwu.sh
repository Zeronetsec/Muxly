# https://github.com/Zeronetsec/Muxly

function module::general::Uwu() {
    local faces=(
        "(｡◕‿◕｡)"
        "(≧◡≦)"
        "ʕ•ᴥ•ʔ"
        "(・ω・)"
        "(๑˃ᴗ˂)ﻭ"
        "(ง'̀-'́)ง"
        "(=^･ω･^=)"
    )

    local delay=0.2
    local duration=5
    SECONDS=0

    while (( SECONDS < duration )); do
        for face in "${faces[@]}"; do
            (( SECONDS >= duration )) && break
            printf "\r%s\x1b[K" "${face}"
            command sleep "${delay}"
        done
    done

    return 0
}; readonly -f module::general::Uwu

# Copyright (c) 2026 Zeronetsec