# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/7b6e1249b7320e16792e31ce67bb2e5f4acd6a8b -> rust-analyzer-20260413-7b6e124.tar.gz
https://direct.funtoo.org/9a/b5/2b/9ab52be314654c0ab8a5e461a3163ed4f2c5efacc5039f895fc8ec714e2f2c67a311330018012daf5c79ecb43b52ea37c74d93bfe5edb7e4bfbaef4cacb9a75d -> rust-analyzer-20260413-funtoo-crates-bundle-ab3100fee6fa30102f5733a26a63ac2361bd2556f7757767c3ebd9e004744531a73712af70f9c538e222e092312c062b22310c33fca233e14c51141f980e5d75.tar.gz"

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