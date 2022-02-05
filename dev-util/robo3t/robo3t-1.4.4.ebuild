# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils pax-utils xdg-utils gnome2-utils

DESCRIPTION="Native cross-platform MongoDB management tool"
SRC_URI="https://github.com/Studio3T/robomongo/releases/download/v${PV}/${P}-linux-x86_64-e6ac9ec.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://robomongo.org/"
KEYWORDS="~amd64"
SLOT="0"
LICENSE="GPL 3"
IUSE=""

RDEPEND="
"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}-linux-x86_64-7419c406"

src_unpack() {
	unpack ${A}
}

src_install() {
	declare ROBO3T_HOME=/opt/${PN}

	# Install robo3t in /opt
	dodir ${ROBO3T_HOME%/*}
	mv "${S}" "${ED}"${ROBO3T_HOME} || die
	insinto ${ROBO3T_HOME}

	# Create /usr/bin/robo3t
	dodir /usr/bin/
	cat <<-EOF >"${ED}"usr/bin/${PN}
	#!/bin/sh
	exec /opt/${PN}/bin/${PN} "\$@"
	EOF
	fperms 0755 /usr/bin/${PN}

	insinto /usr/share/applications
	doins "${FILESDIR}/robo3t.desktop"
}

pkg_postinst() {
	xdg_desktop_database_update
}
