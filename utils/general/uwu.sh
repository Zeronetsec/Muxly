# Muxly Project

function __uwu__() {
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
            printf "\r%s\033[K" "$face"
            command sleep "$delay"
        done
    done

    return 0
}

# Copyright (c) 2026 Zeronetsec