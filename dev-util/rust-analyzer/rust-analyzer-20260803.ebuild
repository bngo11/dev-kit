# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/b54a82b321c9617c5cf0b07ac0f12c08f7bc5902 -> rust-analyzer-20260803-b54a82b.tar.gz
https://direct.funtoo.org/42/13/3a/42133a1e8c63272c4dccc0c6f04b1ff7e110bfee10d4a2221f22e20df08af289e1fce7874a4e61c0e2c5f3cb9dd08ca0d429a6098e17b6e4dcbc4086055496b4 -> rust-analyzer-20260803-funtoo-crates-bundle-c7dfc701b3939b1698f49379b7a8690242df3d47943541d16281e0a9bcc70306b2779a23bb4f0a81213c369ac111b5620de820c6a4f1517d03d46e76bae92c49.tar.gz"

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