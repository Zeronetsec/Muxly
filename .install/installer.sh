function install::installer() {
    if [[ "${__BACKUP__}" == true && -d "${opt}/muxly" ]]; then
        (
            cd "${opt}"
            install::getinstall \
                "
                    command zip -r \
                        muxly_${bkdate}.bak.zip \
                        muxly
                " \
                "Backup: ${GG}${opt}/muxly ${DG}-> ${GG}${opt}/muxly_${bkdate}.bak.zip${N}"
            cd
        )
    fi

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

    if [[ ! -d "${HOME}/.config/muxly" ]]; then
        install::getinstall \
            "
                command mkdir -p \
                    ${HOME}/.config/muxly
            " \
            "Create directory: ${GG}${HOME}/.config/muxly${N}"
    fi

    if [[ ! -f "${HOME}/.config/muxly/config.conf" ]]; then
        install::getinstall \
            "
                command cp \
                    ${root}/config/config.conf \
                    ${HOME}/.config/muxly/config.conf
            " \
            "Copying: ${GG}${root}/config/config.conf ${DG}-> ${GG}${HOME}/.config/muxly/config.conf${N}"
    fi

    install::getinstall \
        "command rm -rf ${opt}/muxly" \
        "Removing old source..."

    install::getinstall \
        "command mv ${root} ${opt}/muxly" \
        "Moving: ${GG}${root} ${DG}-> ${GG}${opt}/muxly${N}"

    install::getinstall \
        "
            command ln -sf \
                ${opt}/muxly/muxly.rb \
                ${bin}/muxly
        " \
        "Symlink: ${GG}${opt}/muxly/muxly.rb ${DG}-> ${GG}${bin}/muxly${N}"

    install::getinstall \
        "
            command ln -sf \
                ${opt}/muxly/vendor/pd530/proot-distro.py \
                ${bin}/pd530
        " \
        "Symlink: ${GG}${opt}/muxly/vendor/pd530/proot-distro.py ${DG}-> ${GG}${bin}/pd530${N}"

    install::getinstall \
        "command termux-reload-settings" \
        "Reload settings..."
}; readonly -f install::installer