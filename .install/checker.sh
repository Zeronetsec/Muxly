function install::checker() {
    if command -v ${targetins} &>/dev/null && command -v pd530 &>/dev/null; then
        echo -e "${GG}[+] ${N}${targetins^} installed!"
        echo -e "${GG}[+] ${N}Usage: ${GG}${targetins} --help ${N}to show helper"
        return 0
    elif command -v ${targetins} &>/dev/null; then
        echo -e "${GG}[+] ${N}${targetins^} installed!"
        echo -e "\x1b[0;33m[!] ${N}Failed installing: ${GG}pd530${N}"
        echo -e "\x1b[0;33m[!] ${N}${targetins^} was installed without support or capabilities for rootfs management."
        echo -e "${GG}[+] ${N}Usage: ${GG}${targetins} --help ${N}to show helper"
        return 0
    else
        echo -e "${R}[!] ${N}Failed installing: ${GG}${targetins}${N}"
        return 1
    fi
}; readonly -f install::checker