#!/bin/sh

srcdir=.

prefix=$HOME/.local
bindir=${prefix}/bin
scriptsdir=${prefix}/share/nautilus/scripts
localedir=${prefix}/share/locale
langdir=${srcdir}/po

INSTALL="/usr/bin/install -v"
mode="-m 755"
MSGFMT="/usr/bin/msgfmt"

# installing scsripts
if [ ! -d "$bindir" ]; then
  mkdir -v "$bindir"
fi

eval "$INSTALL $mode $srcdir/src/pkg_info $bindir"
eval "$INSTALL $mode $srcdir/src/'Show package info' $scriptsdir"

# installation of program translations
if [ ! -d "$localedir" ]; then
  mkdir -pv "$localedir"
fi

LINGUAS=$(cat $langdir/LINGUAS | sed '/#/d')

for LANG in $LINGUAS; do
  if [ -f "$langdir/$LANG.po" ]; then
    if [ ! -d "$localedir/$LANG/LC_MESSAGES" ]; then
      mkdir -pv "$localedir/$LANG/LC_MESSAGES"
    fi
    eval "$MSGFMT -v -o $localedir/$LANG/LC_MESSAGES/pkg_info.mo $langdir/$LANG.po"
    if [ -f "$localedir/$LANG/LC_MESSAGES/pkg_info.mo" ]; then
      echo "localization $LANG successfully set"
    fi
  else
    echo "missing translation file for $LANG localization"
  fi
done
