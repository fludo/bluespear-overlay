# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils multilib

DESCRIPTION="A tool for converting Android's .dex format to Java's .class format"
HOMEPAGE="http://code.google.com/p/dex2jar/"
PSUFFIX="-SNAPSHOT"
SRC_URI="http://dex2jar.googlecode.com/files/${PF}${PSUFFIX}.zip"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~x86-64"
IUSE=""
RESTRICT="strip mirror"

DEPEND=""
RDEPEND="${DEPEND}"

MY_SUBDIR="${PF}${PSUFFIX}"
S="${WORKDIR}/${MY_SUBDIR}"

src_unpack() {
    unpack ${A}
    # go to the source 
    cd "${S}" 
    #remove unneded bat files
    rm `find . -type f -iname '*.bat'`
    
    # Fix permissions
    chmod a+x dex2jar-dump.sh  dex2jar.sh
    chmod a-x LICENSE.txt NOTICE.txt
}


src_install() {
	cd "${S}"
        for f in $(find .); do
                local t="$(dirname ${f})"

                if [[ ! -d "${f}" ]]; then
                        if [[ -x "${f}" ]]; then
                                exeinto "/opt/dex2jar/${t}"
                                doexe "${f}"
                        else
                                insinto "/opt/dex2jar/${t}"
                                doins "${f}"
                        fi
                fi
        done


	exeinto "/usr/bin"
	doexe "${FILESDIR}/dex2jar"

        
}

pkg_postinst() {
		einfo "This is an unsupported ebuild."
}

