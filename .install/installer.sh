function install::installer() {
    local tprop="${HOME}/.termux/termux.properties"
    local tfont="${HOME}/.termux/font.ttf"
    local tth="${HOME}/.termux/colors.properties"
    local rfs="${prefix}/var/lib/pd530/containers"

    if [[ "${__BACKUP__}" == true ]]; then
        if [[ -f "${tprop}" || -L "${tprop}" ]]; then
            install::getinstall \
                "
                    command cp \
                        ${tprop} \
                        ${tprop}_${bkdate}.bak
                " \
                "Backup: ${GG}${tprop} ${DG}-> ${GG}${tprop}_${bkdate}.bak${N}"
        fi

        if [[ -f "${tfont}" || -L "${tfont}" ]]; then
            install::getinstall \
                "
                    command cp \
                        ${tfont} \
                        ${tfont}_${bkdate}.bak
                " \
                "Backup: ${GG}${tfont} ${DG}-> ${GG}${tfont}_${bkdate}.bak${N}"
        fi

        if [[ -f "${tth}" || -L "${tth}" ]]; then
            install::getinstall \
                "
                    command cp \
                        ${tth} \
                        ${tth}_${bkdate}.bak
                " \
                "Backup: ${GG}${tth} ${DG}-> ${GG}${tth}_${bkdate}.bak${N}"
        fi
    fi

    if [[ ! -d "${rfs}" ]]; then
        install::getinstall \
            "command mkdir -p ${rfs}" \
            "Create directory: ${GG}${rfs}${N}"
    fi

    if [[ ! -d "${HOME}/.config/${targetins}" ]]; then
        install::getinstall \
            "
                command mkdir -p \
                    ${HOME}/.config/${targetins}
            " \
            "Create directory: ${GG}${HOME}/.config/${targetins}${N}"
    fi

    if [[ ! -f "${HOME}/.config/${targetins}/config.conf" ]]; then
        install::getinstall \
            "
                command cp \
                    ${root}/config/config.conf \
                    ${HOME}/.config/${targetins}/config.conf
            " \
            "Copying: ${GG}${root}/config/config.conf ${DG}-> ${GG}${HOME}/.config/${targetins}/config.conf${N}"
    fi

    install::getinstall \
        "command termux-reload-settings" \
        "Reload settings..."
}; readonly -f install::installer