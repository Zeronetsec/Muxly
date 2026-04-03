# Muxly Project

function __birthday__() {
    local birth_date="04-01"
    local today="$(command date '+%m-%d')"
    if [[ "$today" == "$birth_date" ]]; then
        echo -e "${R}› ${N}Happy birthday for ${GG}muxly ${N}🎉"
        printf '\n'
    fi
}

# Copyright (c) 2026 Zeronetsec