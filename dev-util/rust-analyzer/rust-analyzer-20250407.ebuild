# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/588948f2676312152122a4caefccd4062b569823 -> rust-analyzer-20250407-588948f.tar.gz
https://direct.funtoo.org/2b/5b/6d/2b5b6dfafc70e09fac67d0260885a33f0f7a553cf14cb9c4b2a1a3d77f94e88590c6973ae1b65b9f4607f702f81108f956601cc92e4ce990533fc808aabbe967 -> rust-analyzer-20250407-funtoo-crates-bundle-c72d0deabbafea1653df447a4f23e6c0dee3e0efb959046fd460fbe65826c0d8df25b9c4c67167682d5a765f772b7eed37365a76254205f406ee20f01a3440e9.tar.gz"

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