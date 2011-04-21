# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils multilib

DESCRIPTION="A standalone graphical utility that displays Java source codes of “.class” file"
HOMEPAGE="http://java.decompiler.free.fr/?q=jdgui"
SRC_URI="http://java.decompiler.free.fr/jd-gui/downloads/${PF}.linux.i686.tar.gz"
LICENSE="Unknown"
SLOT="0"
KEYWORDS="~x86 ~x86-64"
IUSE=""
RESTRICT="strip mirror fetch"

DEPEND=""
RDEPEND="${DEPEND}"




src_unpack() {
    unpack ${A}
    #remove gnome related stuff (nautilus)
    rm -rf contrib 
    
    rm readme.txt
}


src_install() {
	exeinto "/usr/bin"
	doexe "${WORKDIR}/jd-gui"
}

pkg_postinst() {
		einfo "JD-GUI is free for non-commercial use."
		einfo "This means that JD-GUI shall not be included or embedded into commercial software products. "
		einfo "Nevertheless, JD-GUI may be freely used for personal needs in a commercial or non-commercial environments."
		ewarn "JD-GUI creates a jd-gui.cfg file in the current working directory."
		ewarn "Make sure you run it in a directory you can remove afterwards"
}

