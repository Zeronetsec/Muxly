<!-- https://github.com/Zeronetsec/Muxly -->

[![version](https://img.shields.io/badge/Muxly-Version%200.1-blue.svg?maxAge=259200)]()
[![os](https://img.shields.io/badge/Supported%20OS-Android-blue.svg)]()
[![license](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

# Muxly
Muxly is a Swiss Army knife for Termux customization. <br>
It simplifies managing fonts, themes, cursor styles, shortcuts, and rootfs.

## Features
- Easy font and theme customization
- Flexible cursor and shortcut controls
- Root filesystem (Linux distro) management
- Simple and intuitive CLI experience
- Real-time configuration updates
- And more

## Disclaimer
This tool modifies your `~/.termux/*` and `/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/*`. <br>
Please read the
[DISCLAIMER](https://github.com/Zeronetsec/Muxly/blob/main/DISCLAIMER.md)
before use. <br>
Use at your own risk.

## Installation
```bash
git clone https://github.com/Zeronetsec/Muxly.git
cd Muxly
chmod +x install.sh
./install.sh

# for backup
./install.sh --backup
```

## Usage
```bash
muxly --chfont <font>
muxly --chtheme <theme>
muxly --chcursor <block|underline|bar>
muxly --fullscreen <true|false>
muxly --shortcut-create-session <value>
muxly --disable-session-toast <true|false>
muxly --install-rootfs <distro>
muxly --volume-keys <value>
```
And more commands.

## Credits
- [Termux Styling](https://f-droid.org/id/packages/com.termux.styling/)

## License
This project is licensed under the MIT License. <br>

<!-- Copyright (c) 2026 Zeronetsec -->