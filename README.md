# pkginfo

## Description

Reads package information from a file passed through the Nautilus context menu and displays it in a separate window.

The GUI uses yad version 12.3 (GTK+ 3.24.36).

`Show package info` is configured to run when using the `Wayland` graphical environment. If `X11` is used as the graphical environment, comment out the line

```
GDK_BACKEND=x11 pkg_info "$1"
```

and uncomment the line

```
pkg_info "$1"
```

In other graphical environments, the scripts have not been tested and are not guaranteed to work.

Using the p`kg_info` script from the command line is not guaranteed to work correctly in non-X11 environments.

## Dependencies

 - yad 12.3 (GTK+ 3.24.36)
 - pacmanv6.0.2

The script does not check dependencies. You need to convince yourself of this. If necessary, install the missing ones.

## Installation

 1. To install in the user directory, run the script

     ```
     ./install.sh
     ```

     All necessary scripts will be installed, as well as available translations from the po directory.

 2. For manual installation, copy the files from src to the following directories:

     `pkg_info` copy to `~/.local/bin`, `Show package info` copy to `~/.local/share/nautilus/scripts`

     ```
     cp -v src/pkg_info $HOME/.local/bin/
     cp -v src/Show\ package\ info $HOME/.local/share/nautilus/scripts/
     ```

## Localization

The translation files are located in the po directory. To install localization, run the command (for Russian translation)

```
mkdir -p $HOME/.local/share/locale/en/LC_MESSAGES
msgfmt -o $HOME/.local/share/locale/ru/LC_MESSAGES/pkg_info.mo ru.po
```

## Spreading

This software is distributed as is, without warranty of any kind.
