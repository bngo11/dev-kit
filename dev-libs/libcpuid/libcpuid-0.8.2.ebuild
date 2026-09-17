# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="A small C library for x86 (and x86_64) CPU detection and feature extraction"
HOMEPAGE="http://libcpuid.sourceforge.net/"
SRC_URI="https://github.com/anrieff/libcpuid/tarball/7ac123e3c13013ff6cd2d8c4ec1881177d71357f -> libcpuid-0.8.2-7ac123e.tar.gz"
LICENSE="BSD-2"
SLOT="0/18"
KEYWORDS="*"
IUSE="static-libs"
S="${WORKDIR}/anrieff-libcpuid-7ac123e"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf "$(use_enable static-libs static)"
}

src_install() {
	default
	find "${ED}" -name "*.la" -delete || die
}