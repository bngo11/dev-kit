# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/fb133c8c8064d9f18f19eae8721347872f1679e4 -> rust-analyzer-20250331-fb133c8.tar.gz
https://direct.funtoo.org/b0/30/ea/b030ea2c329e2915d4edd4753b3ff67af78d344c0bc8d552590f66ef90198a42b23b53d1cbcfac8a1bd919a71d3a75e704ea70eb4e2be465ace5ba2d6452acf6 -> rust-analyzer-20250331-funtoo-crates-bundle-c72d0deabbafea1653df447a4f23e6c0dee3e0efb959046fd460fbe65826c0d8df25b9c4c67167682d5a765f772b7eed37365a76254205f406ee20f01a3440e9.tar.gz"

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