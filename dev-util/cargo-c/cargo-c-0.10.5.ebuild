# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://direct.funtoo.org/a3/17/5e/a3175edc8d73286fcf4f286e2e50b918f5e44e646aed57d6bc3535e1ed94a57068c9073718a6019e38993acc94f7acae6475506367aac73bb965c161f8afacfd -> cargo-c-0.10.5-funtoo-crates-bundle-1119715cee5c196871982f36c0e997dfd8cb95b7046f550ef9500955bbed3bea1fde84f25530a93ac260172a64af550a6f960578d7c3099594cad32f17e2b582.tar.gz"

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