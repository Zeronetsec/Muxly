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
                "Backup: ${color_GG}${tprop} ${color_DG}-> ${color_GG}${tprop}_${bkdate}.bak${color_N}"
        fi

        if [[ -f "${tfont}" || -L "${tfont}" ]]; then
            install::getinstall \
                "
                    command cp \
                        ${tfont} \
                        ${tfont}_${bkdate}.bak
                " \
                "Backup: ${color_GG}${tfont} ${color_DG}-> ${color_GG}${tfont}_${bkdate}.bak${color_N}"
        fi

        if [[ -f "${tth}" || -L "${tth}" ]]; then
            install::getinstall \
                "
                    command cp \
                        ${tth} \
                        ${tth}_${bkdate}.bak
                " \
                "Backup: ${color_GG}${tth} ${color_DG}-> ${color_GG}${tth}_${bkdate}.bak${color_N}"
        fi
    fi

    local dummyfile=(
        "${tprop}"
        "${tth}"
        "${tfont}"
    )

    local itr
    for itr in "${dummyfile[@]}"; do
        if [[ ! -f "${itr}" || ! -L "${itr}" ]]; then
            install::getinstall \
                "command touch ${itr}" \
                "Create file: ${color_GG}${itr}${color_N}"
        fi
    done

    if [[ ! -d "${rfs}" ]]; then
        install::getinstall \
            "command mkdir -p ${rfs}" \
            "Create directory: ${color_GG}${rfs}${color_N}"
    fi

    if [[ ! -d "${HOME}/.config/${targetins}" ]]; then
        install::getinstall \
            "
                command mkdir -p \
                    ${HOME}/.config/${targetins}
            " \
            "Create directory: ${color_GG}${HOME}/.config/${targetins}${color_N}"
    fi

    if [[ ! -f "${HOME}/.config/${targetins}/config.conf" ]]; then
        install::getinstall \
            "
                command cp \
                    ${opt}/${targetins}/config/config.conf \
                    ${HOME}/.config/${targetins}/config.conf
            " \
            "Copying: ${color_GG}${opt}/${targetins}/config/config.conf ${color_DG}-> ${color_GG}${HOME}/.config/${targetins}/config.conf${color_N}"
    fi

    install::getinstall \
        "command termux-reload-settings" \
        "Reload settings..."
}; readonly -f install::installer