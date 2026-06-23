<!-- https://github.com/Zeronetsec/Muxly -->

# Installation
`install.sh` optional option:
- `--backup`

Use `--backup` to create a backup of the existing Muxly installation before replacing it.

## Termux (only)
```bash
git clone https://github.com/Zeronetsec/Muxly
cd Muxly
chmod +x install.sh
./install.sh
```

## Uninstallation
```bash
export prefix="${PREFIX:-/usr}"
rm -f "${prefix}/bin/muxly"
rm -f "${prefix}/bin/pd530"
rm -rf "${prefix}/opt/muxly"
rm -rf ~/.config/muxly
```

<!-- Copyright (c) 2026 Zeronetsec -->