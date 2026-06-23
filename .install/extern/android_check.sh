function install::extern::androidCheck() {
    function __android_check__() {
        [[ -x '/system/bin/getprop' ]] && return 0
        [[ -f '/system/bin/linker' || -f '/system/bin/linker64' ]] && return 0
        [[ -d '/dev/cpuctl' ]] && return 0
        [[ -d '/storage/emulated/0/Android' ]] && return 0
        [[ -d '/data/data/com.termux/' ]] && return 0
        [[ -n "${PREFIX}" && -n "${TERMUX_VERSION}" ]] && return 0
        return 1
    }

    echo -e "${B}[*] ${N}Checking android environment..."
    __android_check__ || {
        echo -e "${R}[!] ${N}Termux environment not detected."
        echo -e "${R}[!] ${N}This tool is designed exclusively for the Termux Android app."
        return 1
    }
}