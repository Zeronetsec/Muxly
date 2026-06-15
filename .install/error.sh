function install::error() {
    echo -e " ${DG}- ${N}error: ${R}${?}${N}"
}

trap install::error EXIT