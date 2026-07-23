function install::extern::pipInpackages() {
    function __exit__() {
        local code="${1}"
        if [[ "${code}" -gt 0 ]]; then
            echo -e " ${DG}- ${N}error: ${R}${code}${N}"
            return ${code}
        fi
        echo -e " ${DG}- ${N}exit: ${GG}${code}${N}"
        return ${code}
    }

    command mapfile -t packages < <(
        command cat "${root}/.install/extern/python_packages.txt"
    )

    for line in "${packages[@]}"; do
        [[ -z "${line}" ]] && continue
        [[ "${line}" =~ ^# ]] && continue
        echo -e "${B}[*] ${N}Installing: ${GG}${line}${N}"
        echo -ne "${DG}-> ${N}Try: ${GG}${line}${N}"
        command pip install \
            --upgrade \
            --break-system-packages \
            "${line}" > /dev/null 2>&1
        __exit__ "${?}"
    done
}; readonly -f install::extern::pipInpackages