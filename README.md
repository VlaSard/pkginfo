# pkginfo

## Description

Displays package information in a graphical window. It can show information about both installed packages and packages in files.

It uses yad 12.3 (GTK+ 3.24.36) as its GUI.

## Using

Can work from the command line, or be embedded in the context menu of file managers.

### Command line usage

The script uses the `pacman` utility to retrieve information about the package. To get information about the installed package, use the command

```
pkg_info PACKAGE_NAME
```

The tool will search for the package in the installed database and display information about it. Or it will display a message that the package is not found if there is no information in the database.

Using the `-p` switch you can read information from the package file.

```
pkg_info -p PACKAGE_FILE_NAME
```

### Use from the context menu of file managers

In the `nautilus` directory is the `Show package info` script. Which allows you to use the `pkg_info` utility from the context menu. 

## Dependencies

 - yad 12.3 (GTK+ 3.24.36)
 - Pacman v6.0.2 - libalpm v13.0.2

 > The script does not check addictions. You need to convince yourself of this. Set up the missing ones if necessary.

## Installation

The installation is done as usual using the `install` command.

 - files from the `bin` directory are placed in `/usr/bin` or in the appropriate user directory,
 - files from `nautilus` are placed in the Nautilus scripts directory.

## Localization

The translation files are located in the `po` directory. To install the localization run the command (for the Russian translation)

```
msgfmt -o /usr/share/locale/ru/LC_MESSAGES/pkg_info.mo ru.po
```

## Issues

The `pkg_info` utility is run and operated in an X11 windowed environment.

If `Wayland` is used, run `pkg_info` with the command `GDK_BACKEND=x11 pkg_info -p PACKAGE_FILE_NAME`. It may be necessary to specify `xwayland` instead of `x11`.

In other graphical environments the scripts have not been tested.

Using the `pkg_info` utility from the command line in environments other than `X11` may be broken.

## Distribution

This software is distributed as is, WITHOUT WARRANTY of any kind.

