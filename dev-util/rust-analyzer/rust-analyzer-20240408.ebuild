# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/8e581ac348e223488622f4d3003cb2bd412bf27e -> rust-analyzer-20240408-8e581ac.tar.gz
https://direct.funtoo.org/44/0f/47/440f47421c6a2232602adc13563ee3936e567f02759024276965f948b8b7ed09d2876e47ab7093f7df9df93d9ee05793e555df5ab2904108da4e1147cd55f745 -> rust-analyzer-20240408-funtoo-crates-bundle-881b7bfe29e84ca1054936c0e0f0b3e6e436222ee1e199742dcc45e29a4d6882b3da573f2ad9856bc32bf00fe75d756df5e894c2df23df8578c5dfbf0180193f.tar.gz"

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