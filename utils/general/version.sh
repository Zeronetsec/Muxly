# https://github.com/Zeronetsec/Muxly

function utils::general::Version() {
    local name="Muxly"
    local version="v0.1"
    local creator="Zeronetsec"
    local homepage="https://github.com/Zeronetsec/Muxly"

    echo -e "${N}Name: ${GG}${name}${N}"
    echo -e "${N}Version: ${GG}${version}${N}"
    echo -e "${N}Creator: ${GG}${creator}${N}"
    echo -e "${N}Homepage: ${GG}${homepage}${N}"

    return 0
}

# Copyright (c) 2026 Zeronetsec