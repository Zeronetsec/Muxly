# https://github.com/Zeronetsec/Muxly

function __help__() {
    __birthday__

    echo -e "${N}Usage: ${GG}${tname} ${CC}<command> [<args>]${N}"

    printf '\n'
    echo -e "${N}Font commands:"
    echo -e "    ${R}› ${GG}--chfont ${DG}<${CC}font${DG}> - ${YY}change fonts${N}"
    echo -e "    ${R}› ${GG}--list-fonts ${DG}- ${YY}show available fonts${N}"
    echo -e "    ${R}› ${GG}--reset-font ${DG}- ${YY}reset font to default${N}"

    printf '\n'
    echo -e "${N}Theme commands:"
    echo -e "    ${R}› ${GG}--chtheme ${DG}<${CC}theme${DG}> - ${YY}change theme${N}"
    echo -e "    ${R}› ${GG}--list-themes ${DG}- ${YY}show available themes${N}"
    echo -e "    ${R}› ${GG}--reset-theme ${DG}- ${YY}reset theme to default${N}"
    echo -e "    ${R}› ${GG}--force-black-ui ${DG}<${CC}true${DG}|${CC}false${DG}> - ${YY}force black ui mode${N}"

    printf '\n'
    echo -e "${N}Cursor commands:"
    echo -e "    ${R}› ${GG}--chcursor ${DG}<${CC}block${DG}|${CC}underline${DG}|${CC}bar${DG}> - ${YY}change cursor style${N}"
    echo -e "    ${R}› ${GG}--chcursor-blink-rate ${DG}<${CC}0${DG}-${CC}2000${DG}> - ${YY}set cursor blink rate${N}"
    echo -e "    ${R}› ${GG}--reset-cursor ${DG}- ${YY}reset cursor style${N}"
    echo -e "    ${R}› ${GG}--reset-cursor-blink-rate ${DG}- ${YY}reset blink rate${N}"

    printf '\n'
    echo -e "${N}Screen commands:"
    echo -e "    ${R}› ${GG}--fullscreen ${DG}<${CC}true${DG}|${CC}false${DG}> - ${YY}toggle fullscreen${N}"
    echo -e "    ${R}› ${GG}--fullscreen-workaround ${DG}<${CC}true${DG}|${CC}false${DG}> - ${YY}enable fullscreen fix${N}"
    echo -e "    ${R}› ${GG}--transcript-rows ${DG}<${CC}1${DG}-${CC}50000${DG}> - ${YY}set scrollback lines${N}"
    echo -e "    ${R}› ${GG}--disable-session-toast ${DG}<${CC}true${DG}|${CC}false${DG}> - ${YY}disable session notifications${N}"
    echo -e "    ${R}› ${GG}--reset-transcript-rows ${DG}- ${YY}reset scrollback lines to default${N}"

    printf '\n'
    echo -e "${N}Shortcut commands:"
    echo -e "    ${R}› ${GG}--shortcut-create-session ${DG}<${CC}value${DG}> - ${YY}set create session shortcut${N}"
    echo -e "    ${R}› ${GG}--shortcut-next-session ${DG}<${CC}value${DG}> - ${YY}set next session shortcut${N}"
    echo -e "    ${R}› ${GG}--shortcut-previous-session ${DG}<${CC}value${DG}> - ${YY}set previous session shortcut${N}"
    echo -e "    ${R}› ${GG}--shortcut-rename-session ${DG}<${CC}value${DG}> - ${YY}set rename session shortcut${N}"
    echo -e "    ${R}› ${GG}--reset-shortcut ${DG}- ${YY}reset all shortcuts${N}"

    printf '\n'
    echo -e "${N}Rootfs commands:"
    echo -e "    ${R}› ${GG}--rootfs ${DG}<${CC}distro${DG}> - ${YY}switch root filesystem${N}"
    echo -e "    ${R}› ${GG}--install-rootfs ${DG}<${CC}distro${DG}> - ${YY}install a root filesystem${N}"
    echo -e "    ${R}› ${GG}--list-rootfs ${DG}- ${YY}show available rootfs options${N}"
    echo -e "    ${R}› ${GG}--list-installed-rootfs ${DG}- ${YY}show installed rootfs${N}"
    echo -e "    ${R}› ${GG}--remove-rootfs ${DG}<${CC}distro${DG}> - ${YY}remove an installed root filesystem${N}"
    echo -e "    ${R}› ${GG}--reset-rootfs ${DG}<${CC}distro${DG}> - ${YY}reset a root filesystem${N}"
    echo -e "    ${R}› ${GG}--rootfs-command ${DG}<${CC}distro${DG}> <${CC}command${DG}> - ${YY}execute a command inside a specific rootfs${N}"
    echo -e "    ${R}› ${GG}--symlink ${DG}<${CC}distro${DG}> <${CC}command${DG}> - ${YY}create a host symlink for a rootfs command${N}"

    printf '\n'
    echo -e "${N}Input commands:"
    echo -e "    ${R}› ${GG}--volume-keys ${DG}<${CC}value${DG}> - ${YY}configure volume key behavior${N}"

    printf '\n'
    echo -e "${N}General commands:"
    echo -e "    ${R}› ${GG}--info ${DG}- ${YY}show muxly configurations${N}"
    echo -e "    ${R}› ${GG}--help ${DG}- ${YY}show help${N}"
    echo -e "    ${R}› ${GG}--version ${DG}- ${YY}show version${N}"

    return 0
}

# Copyright (c) 2026 Zeronetsec