# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils pax-utils xdg-utils gnome2-utils

DESCRIPTION="The complete API-First Development Platform"
SRC_URI="https://dl.pstmn.io/download/latest/linux64 -> ${P}.tar.gz"
HOMEPAGE="https://www.getpostman.com/"
KEYWORDS="~amd64"
SLOT="0"
LICENSE="Postman"
IUSE=""

RDEPEND="
"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
}

src_install() {
	declare POSTMAN_HOME=/opt/${PN}

	# Install postman in /opt
	dodir ${POSTMAN_HOME%/*}
	mv "${S}" "${ED}"${POSTMAN_HOME} || die
	insinto ${POSTMAN_HOME}

	# Create /usr/bin/postman
	dodir /usr/bin/
	cat <<-EOF >"${ED}"usr/bin/${PN}
	#!/bin/sh
	exec /opt/${PN}/${PN} "\$@"
	EOF
	fperms 0755 /usr/bin/${PN}

	insinto /usr/share/applications
	doins "${FILESDIR}/postman.desktop"
}

pkg_postinst() {
	xdg_desktop_database_update
}
