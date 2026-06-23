<!-- https://github.com/Zeronetsec/Muxly -->

# DISCLAIMER
## **Version 0.1 (Experimental Status)**
This tool is currently in its early **v0.1** stage and is considered **unstable**. </br>
You may encounter bugs, system errors, or unexpected behavior. </br>
Additionally, core structures, commands, and language configurations are highly subject to change in future updates.

This tool is specifically designed for use within the **Termux** environment.

## System Modifications
This tool performs modifications on the following directories:
- `~/.termux/*` </br>
  Used to modify:
  - Theme (color scheme)
  - Font
  - Shortcuts (key bindings)
  - Other configuration settings related to the appearance and usability of Termux

- `/data/data/com.termux/files/usr/var/lib/proot-distro/containers/*` </br>
  Used to:
  - Install custom rootfs
  - Remove installed rootfs

## Vendored Packages
This project intentionally ships with a vendored copy of **proot-distro v5.3.0**. </br>
This version is pinned to ensure long-term stability and reduce the risk of breaking changes from upstream releases.

As a result, the bundled version may not receive future updates unless there is a compelling reason to update it. </br>
Stability and compatibility are prioritized over tracking the latest upstream releases.

The vendored binary is installed at:
- `$PREFIX/bin/pd530`

While the executable name is version-specific, all container root filesystems continue to use the standard storage location:
- `$PREFIX/var/lib/proot-distro/containers`

This allows existing rootfs data to remain compatible and centralized regardless of the custom binary name used by this project.

## Risks
By using this tool, you acknowledge that:
- The changes made may affect your Termux configuration
- Improper use may cause issues or break your Termux environment
- Modifying or removing rootfs may result in data loss

## Responsibility
You are fully responsible for any risks or damage caused by using this tool. </br>
It is strongly recommended to create backups before using this tool.

## Notes
This tool is not affiliated with the official Termux project and is provided "as is", without warranties of any kind.

<!-- Copyright (c) 2026 Zeronetsec -->