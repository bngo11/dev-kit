# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/7ea2b259ca3fa0e97d0e8e2ec4c3f902f049cd76 -> rust-analyzer-20260608-7ea2b25.tar.gz
https://direct.funtoo.org/25/45/09/25450908269b2cb4a41f651f6f067351e35c020e233951cae329cd8f67aa81ead1c501c8f2dc3c2301587673d336068d86e146eca08f971b924383287df0a322 -> rust-analyzer-20260608-funtoo-crates-bundle-1635f1b829c536768af1a5ea3759b6067d081e3371ba2baa95f567de8aed57d6f90ffd65c07a5e8c6ea527382987b780c14710acc3088dbf13ad6bbee2f3ed23.tar.gz"

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