# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/0f7f68dad2e0e545150e6088f0e1964f7455e9e1 -> rust-analyzer-20240827-0f7f68d.tar.gz
https://direct.funtoo.org/ba/45/69/ba4569d800c6c417f3324b79aa901d6589fbbd53e048d6520cb218c867770302d0cf8f4b19284f4c0399202ea2114dd67c4b6369ab06721b8bc80c332d3e011d -> rust-analyzer-20240827-funtoo-crates-bundle-542f54717e25025c2a25f7d56027bc4bbf3f009b3d8325dee249332479da911fe28e98b0f15910cc95e7b0adc29910c74ca015db6631f5222378771a833dba7a.tar.gz"

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