# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/c4618fe14d39992fbbb85c2d6cad028a232c13d2 -> rust-analyzer-20240506-c4618fe.tar.gz
https://direct.funtoo.org/d0/9d/27/d09d277d6d0a4f7164c9229a6d308c81c7532a6b62357911aa851515e762bce7297a0b67c65a750c9028a3904d970360e2c4e56c0211c509e6f10241c1185960 -> rust-analyzer-20240506-funtoo-crates-bundle-5266e5c13da942f79c405fdaad4b343d0c36a95407755797349ba10923ac4b5c90380cfbb9148aa4c68d22d617e336064ffcc585f0f97101bebe9ae1c17981af.tar.gz"

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