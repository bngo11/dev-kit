# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/be6975f8f90d33a3b205265a0a858ee29fabae13 -> rust-analyzer-20251229-be6975f.tar.gz
https://direct.funtoo.org/44/1f/e7/441fe78935db6377d50007663799883b4766a366da6fe34a48a1075b3ca008ae3eb5bf0452e1dfc16e43854f9fa217584562c8f2e328659746e237bed9da9847 -> rust-analyzer-20251229-funtoo-crates-bundle-ea7ce95f1284dffa33054e22ee3f9a1b5633c8f05b0d8f723809b35ed841176d5ea2c927bb6d1bb75dd68e9f80435d43298fa867c55a4e4051141fb0bc622e2a.tar.gz"

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