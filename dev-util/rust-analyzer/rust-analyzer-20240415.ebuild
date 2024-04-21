# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/5dbe3fe75c584aee2063ef7877a639fe3382461e -> rust-analyzer-20240415-5dbe3fe.tar.gz
https://direct.funtoo.org/a2/81/64/a28164432de98c2eccce40a5289233f6d842acb9f722992afdca227407e4291b05a08374e50f55ea4ca99bc41f46b549a3f71d12bb4d6853a162f9541110d557 -> rust-analyzer-20240415-funtoo-crates-bundle-6d855821a0ad4f2b62631973853cf162858f71dc6ed372d3e2744f00eafd9f62206f70106555a88b293a5e17c04aabba36870bc3631ce1aa2ea9ecac4c306f50.tar.gz"

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