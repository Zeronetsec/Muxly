<!-- https://github.com/Zeronetsec/Muxly -->

# Installation
`install.sh` optional option:
- `--backup`
- └── create a backup of the existing source installation before replacing it.

### Usage
```bash
git clone https://github.com/Zeronetsec/Muxly
bash Muxly/install.sh <option>
```

# Uninstallation
`uninstall.sh` optional options (can be used together):
- `--remove-backup`
- └── remove all backup found.
- `--no-remove-config`
- └── do not remove `~/.config/muxly/config.conf`

### Usage
```bash
export prefix="${PREFIX:-/usr}"
bash $prefix/opt/muxly/uninstall.sh <option>
```

<!-- Copyright (c) 2026 Zeronetsec -->