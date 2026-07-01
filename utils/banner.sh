# https://github.com/Zeronetsec/Muxly

function utils::banner() {
    local banner="${root}/data/banner.txt"
    echo -ne "${B}"
    command cat "${banner}"
    echo -ne "${N}"
    printf '\n'
}; readonly -f utils::banner

# Copyright (c) 2026 Zeronetsec