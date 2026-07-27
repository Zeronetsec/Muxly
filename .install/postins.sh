function install::postins() {
    install::getinstall \
        "command rm -rf ${opt}/${targetins}" \
        "Removing old source..."

    install::getinstall \
        "command mv ${root} ${opt}/${targetins}" \
        "Moving: ${GG}${root} ${DG}-> ${GG}${opt}/${targetins}${N}"
}; readonly -f install::postins