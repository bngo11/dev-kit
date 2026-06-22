# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/b3694fc3f414a13205764023398d67e5be0a42bf -> bottom-0.14.1-b3694fc.tar.gz
https://direct.funtoo.org/96/80/7c/96807c80bca66ead0bc8888b1b4082a310806dd1974bdf67868f9a067d5c316a2e2e3f7426c2e7bf6571eefc2e40f796eed0c58818db1b05ba17860705f4f39f -> bottom-0.14.1-funtoo-crates-bundle-2e6f5f900c69cde3afeb552d3f19ef4b8cbb0b429face1a6280f4052dff2edfdba407f86b023e53718a1266579f915d18861a58ec0bd88db05ab1a0fd06c5b51.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md CHANGELOG.md )

QA_FLAGS_IGNORED="/usr/bin/btm"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/ClementTsang-bottom-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}