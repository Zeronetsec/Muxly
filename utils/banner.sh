# https://github.com/Zeronetsec/Muxly

function utils::banner() {
    local banner="${root}/data/banner.txt"
    echo -ne "${B}"
    command cat "${banner}"
    echo -ne "${N}"
    printf '\n'
}

# Copyright (c) 2026 Zeronetsec