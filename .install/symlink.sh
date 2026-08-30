function install::symlink() {
    install::getinstall \
        "
            command ln -sf \
                ${opt}/${targetins}/vendor/pd530/proot-distro.py \
                ${bin}/pd530
        " \
        "Symlink: ${color_GG}${opt}/${targetins}/vendor/pd530/proot-distro.py ${color_DG}-> ${color_GG}${bin}/pd530${color_N}"

    install::getinstall \
        "
            command ln -sf \
                ${opt}/${targetins}/${targetsyml} \
                ${bin}/${targetins}
        " \
        "Symlink: ${color_GG}${opt}/${targetins}/${targetsyml} ${color_DG}-> ${color_GG}${bin}/${targetins}${color_N}"
}; readonly -f install::symlink