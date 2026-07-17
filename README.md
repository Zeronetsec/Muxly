<!-- https://github.com/Zeronetsec/Muxly -->

<img src="https://img.shields.io/badge/Muxly-Version%200.1-blue.svg?style=square&logo=ruby&logoColor=red" />
<img src="https://img.shields.io/badge/Supported%20OS-Android-blue.svg?style=square&logo=android" />
<img src="https://img.shields.io/badge/License-GPLv3-blue.svg?style=square&logo=github" />

# Muxly
Muxly is a Swiss Army knife for Termux customization, including fonts, themes, cursor styles, shortcuts, and rootfs management.

## Features
- Easy font and theme customization.
- Flexible cursor and shortcut controls.
- Root filesystem (Linux distro) management.
- Simple and intuitive CLI experience.
- And more features.

## Disclaimer
Please read [.docs/disclaimer.md](.docs/disclaimer.md) before using this tool. </br>
Use this software at your own risk. </br>
The author is not responsible for any damage, data loss, or issues that may result from its use.

## Installation
Quick install:
```bash
git clone https://github.com/Zeronetsec/Muxly
cd Muxly
chmod +x install.sh
./install.sh
```
For more detailed installation and uninstallation instructions, see [.docs/install_and_uninstall.md](.docs/install_and_uninstall.md).

## Usage Example
```bash
muxly --chfont source_code_pro
muxly --chtheme tokyonight_dark
muxly --chcursor underline
muxly --shortcut-create-session 'ctrl+`'
muxly --install-rootfs kali_rolling
```
And more commands.

## Credits
This project incorporates components from third-party sources. </br>
Please refer to [.docs/credits.md](.docs/credits.md) for full details and licensing information.

## License
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, version 3.

<!-- Copyright (c) 2026 Zeronetsec -->