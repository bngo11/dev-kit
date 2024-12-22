# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/27e824fad4cb40f9e475757871e7d259d73f20da -> rust-analyzer-20241216-27e824f.tar.gz
https://direct.funtoo.org/f3/54/60/f3546017b81d39b1ea11336e8f56c718548a0951325197324712aa50bb3fc821819e553f4b1dcd21fde0cef2d82dd4974975e260c0e4b6270d28a2823633d374 -> rust-analyzer-20241216-funtoo-crates-bundle-8a72ec194a03a7f2227527d498a8d30fb1ad828a55e976c2a76b622eb5b202defc268da291dfafce87d9ed4308eeabe552af17602955707b7c7b629701c5e357.tar.gz"

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