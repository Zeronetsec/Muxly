function install::chmod() {
    target=(
        "pd530"
        "muxly"
    )

    for i in "${target[@]}"; do
        if [[ ! -x "${bin}/${i}" ]]; then
            install::getinstall \
                "command chmod +x ${bin}/${i}" \
                "Set permission for: ${GG}${bin}/${i}${N}"
        fi
    done
}; readonly -f install::chmod