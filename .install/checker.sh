function install::checker() {
    if command -v ${targetins} &>/dev/null && command -v pd530 &>/dev/null; then
        echo -e "${color_GG}[+] ${color_N}${targetins^} installed!"
        echo -e "${color_GG}[+] ${color_N}Usage: ${color_GG}${targetins} --help ${color_N}to show helper"
        return 0
    elif command -v ${targetins} &>/dev/null; then
        echo -e "${color_GG}[+] ${color_N}${targetins^} installed!"
        echo -e "\x1b[0;33m[!] ${color_N}Failed installing: ${color_GG}pd530${color_N}"
        echo -e "\x1b[0;33m[!] ${color_N}${targetins^} was installed without support or capabilities for rootfs management."
        echo -e "${color_GG}[+] ${color_N}Usage: ${color_GG}${targetins} --help ${color_N}to show helper"
        return 0
    else
        echo -e "${color_R}[!] ${color_N}Failed installing: ${color_GG}${targetins}${color_N}"
        return 1
    fi
}; readonly -f install::checker