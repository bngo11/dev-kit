# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/f216be4a0746142c5f30835b254871256a7637b8 -> rust-analyzer-20240429-f216be4.tar.gz
https://direct.funtoo.org/1f/c2/44/1fc2441f03616876e4e2b5d1d7c8ff45c76fb660338539418915ef61626b09943f583bc48651df0c9aa208597f2f1cc0036a00e7f199ada4c611176fd024e4d8 -> rust-analyzer-20240429-funtoo-crates-bundle-5266e5c13da942f79c405fdaad4b343d0c36a95407755797349ba10923ac4b5c90380cfbb9148aa4c68d22d617e336064ffcc585f0f97101bebe9ae1c17981af.tar.gz"

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