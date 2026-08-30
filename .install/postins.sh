function install::postins() {
    install::getinstall \
        "command rm -rf ${opt}/${targetins}" \
        "Removing old source..."

    install::getinstall \
        "command mv ${root} ${opt}/${targetins}" \
        "Moving: ${color_GG}${root} ${color_DG}-> ${color_GG}${opt}/${targetins}${color_N}"
}; readonly -f install::postins