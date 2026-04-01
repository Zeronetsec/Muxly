# Muxly Project

function __help__() {
    echo -e "${N}Font commands:"
    echo -e "    ${WW}muxly ${GG}--chfont ${DG}<${CC}font${DG}> - ${YY}change fonts${N}"
    echo -e "    ${WW}muxly ${GG}--list-fonts ${DG}- ${YY}show available fonts${N}"
    echo -e "    ${WW}muxly ${GG}--reset-font ${DG}- ${YY}reset font to default${N}"

    printf '\n'
    echo -e "${N}Theme commands:"
    echo -e "    ${WW}muxly ${GG}--chtheme ${DG}<${CC}theme${DG}> - ${YY}change theme${N}"
    echo -e "    ${WW}muxly ${GG}--list-themes ${DG}- ${YY}show available themes${N}"
    echo -e "    ${WW}muxly ${GG}--reset-theme ${DG}- ${YY}reset theme to default${N}"
    echo -e "    ${WW}muxly ${GG}--force-black-ui ${DG}<${CC}true${DG}|${CC}false${DG}> - ${YY}force black ui mode${N}"

    printf '\n'
    echo -e "${N}Cursor commands:"
    echo -e "    ${WW}muxly ${GG}--chcursor ${DG}<${CC}block${DG}|${CC}underline${DG}|${CC}bar${DG}> - ${YY}change cursor style${N}"
    echo -e "    ${WW}muxly ${GG}--chcursor-blink-rate ${DG}<${CC}0${DG}-${CC}2000${DG}> - ${YY}set cursor blink rate${N}"
    echo -e "    ${WW}muxly ${GG}--reset-cursor ${DG}- ${YY}reset cursor style${N}"
    echo -e "    ${WW}muxly ${GG}--reset-cursor-blink-rate ${DG}- ${YY}reset blink rate${N}"

    printf '\n'
    echo -e "${N}Screen commands:"
    echo -e "    ${WW}muxly ${GG}--fullscreen ${DG}<${CC}true${DG}|${CC}false${DG}> - ${YY}toggle fullscreen${N}"
    echo -e "    ${WW}muxly ${GG}--fullscreen-workaround ${DG}<${CC}true${DG}|${CC}false${DG}> - ${YY}enable fullscreen fix${N}"
    echo -e "    ${WW}muxly ${GG}--transcript-rows ${DG}<${CC}1${DG}-${CC}50000${DG}> - ${YY}set scrollback lines${N}"
    echo -e "    ${WW}muxly ${GG}--disable-session-toast ${DG}<${CC}true${DG}|${CC}false${DG}> - ${YY}disable session notifications${N}"
    echo -e "    ${WW}muxly ${GG}--reset-transcript-rows ${DG}- ${YY}reset scrollback lines to default${N}"

    printf '\n'
    echo -e "${N}Shortcut commands:"
    echo -e "    ${WW}muxly ${GG}--shortcut-create-session ${DG}<${CC}value${DG}> - ${YY}set create session shortcut${N}"
    echo -e "    ${WW}muxly ${GG}--shortcut-next-session ${DG}<${CC}value${DG}> - ${YY}set next session shortcut${N}"
    echo -e "    ${WW}muxly ${GG}--shortcut-previous-session ${DG}<${CC}value${DG}> - ${YY}set previous session shortcut${N}"
    echo -e "    ${WW}muxly ${GG}--shortcut-rename-session ${DG}<${CC}value${DG}> - ${YY}set rename session shortcut${N}"
    echo -e "    ${WW}muxly ${GG}--reset-shortcut ${DG}- ${YY}reset all shortcuts${N}"

    printf '\n'
    echo -e "${N}Rootfs commands:"
    echo -e "    ${WW}muxly ${GG}--rootfs ${DG}<${CC}distro${DG}> - ${YY}switch root filesystem${N}"
    echo -e "    ${WW}muxly ${GG}--install-rootfs ${DG}<${CC}distro${DG}> - ${YY}install a root filesystem${N}"
    echo -e "    ${WW}muxly ${GG}--list-rootfs ${DG}- ${YY}show available rootfs options${N}"
    echo -e "    ${WW}muxly ${GG}--list-installed-rootfs ${DG}- ${YY}show installed rootfs${N}"
    echo -e "    ${WW}muxly ${GG}--remove-rootfs ${DG}<${CC}distro${DG}> - ${YY}remove an installed root filesystem${N}"
    echo -e "    ${WW}muxly ${GG}--reset-rootfs ${DG}<${CC}distro${DG}> - ${YY}reset a root filesystem${N}"

    printf '\n'
    echo -e "${N}Input commands:"
    echo -e "    ${WW}muxly ${GG}--volume-keys ${DG}<${CC}value${DG}> - ${YY}configure volume key behavior${N}"

    printf '\n'
    echo -e "${N}General commands:"
    echo -e "    ${WW}muxly ${GG}--info ${DG}- ${YY}show muxly configurations${N}"
    echo -e "    ${WW}muxly ${GG}--help ${DG}- ${YY}show help${N}"
    echo -e "    ${WW}muxly ${GG}--version ${DG}- ${YY}show version${N}"

    return 0
}

# Copyright (c) 2026 Zeronetsec