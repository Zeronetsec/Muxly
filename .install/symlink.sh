function install::symlink() {
    install::getinstall \
        "
            command ln -sf \
                ${opt}/${targetins}/vendor/pd530/proot-distro.py \
                ${bin}/pd530
        " \
        "Symlink: ${GG}${opt}/${targetins}/vendor/pd530/proot-distro.py ${DG}-> ${GG}${bin}/pd530${N}"

    install::getinstall \
        "
            command ln -sf \
                ${opt}/${targetins}/${targetsyml} \
                ${bin}/${targetins}
        " \
        "Symlink: ${GG}${opt}/${targetins}/${targetsyml} ${DG}-> ${GG}${bin}/${targetins}${N}"
}; readonly -f install::symlink