# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/3a2b7cfc1e9eb4fb9054d23dd816b59d10a2f49e -> cargo-c-0.10.2-3a2b7cf.tar.gz
https://direct.funtoo.org/99/09/0a/99090a725a9368b8ffd30d7fa590ece14e1f1c2b1b548fe67f73401043f7420107f66b4f13d3111034193149fdedcc2f9022498ba45bb675d65b9509396faebf -> cargo-c-0.10.2-funtoo-crates-bundle-8afb4ccd458c9477ed9b3f42f1399db1f1b748290e1464866180d075312e52749c3281ecb31eeb8241a64f75c7406c2ccecbc6d9a72300e0ec7a9e82d068a87d.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="sys-libs/zlib
	dev-libs/openssl:0=
	dev-vcs/git
	net-misc/curl[ssl]
"
BDEPEND="virtual/rust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lu-zero-cargo-c-* ${S} || die
}