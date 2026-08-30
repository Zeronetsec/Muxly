function install::extern::pipInpackages() {
    function __exit__() {
        local code="${1}"
        if [[ "${code}" -gt 0 ]]; then
            echo -e " ${color_DG}- ${color_N}error: ${color_R}${code}${color_N}"
            return ${code}
        fi
        echo -e " ${color_DG}- ${color_N}exit: ${color_GG}${code}${color_N}"
        return ${code}
    }

    command mapfile -t packages < <(
        command cat "${root}/.install/extern/python_packages.txt"
    )

    for line in "${packages[@]}"; do
        [[ -z "${line}" ]] && continue
        [[ "${line}" =~ ^# ]] && continue
        echo -e "${color_B}[*] ${color_N}Installing: ${color_GG}${line}${color_N}"
        echo -ne "${color_DG}-> ${color_N}Try: ${color_GG}${line}${color_N}"
        command pip install \
            --upgrade \
            --break-system-packages \
            "${line}" > /dev/null 2>&1
        __exit__ "${?}"
    done
}; readonly -f install::extern::pipInpackages