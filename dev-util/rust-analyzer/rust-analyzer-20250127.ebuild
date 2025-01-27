# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/2df4ecfc74bbadf1281e13d73f8424f7b5c1514b -> rust-analyzer-20250127-2df4ecf.tar.gz
https://direct.funtoo.org/e3/b1/65/e3b16587ba0a9048fbe864724c6db7f9783e94396ad14a991c686820b684dd341c78b871e468ae40375619827695b29ae770a35ad2acbb15a05f315d6d0e5576 -> rust-analyzer-20250127-funtoo-crates-bundle-a72c9430ed49130fe02070f3b6d5006e442772686a9458aa3a6ea95d8afd89c4ea194d70874a129016b0def9329427a11278851c9c4fe0571abcea3a698a144a.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/rust-analyzer"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/rust-lang-rust-analyzer-* ${S} || die
}

# To populate a custom version for rust-analyzer use the CFG_RELEASE environmental variable
# If this is not set rust-analyzer --version will return 0.0.0
# Upstream code reference: https://github.com/rust-lang/rust-analyzer/blob/master/crates/rust-analyzer/src/version.rs
src_install() {
	RUST_VERSION="$(rustc --version | awk {'print $2'})"
	CFG_RELEASE="$RUST_VERSION (-standalone-funtoo)" cargo_src_install --path "./crates/rust-analyzer"
	einstalldocs
}