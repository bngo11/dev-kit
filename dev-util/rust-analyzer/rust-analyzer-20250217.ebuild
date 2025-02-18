# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/84b6936e0856d0cac8d616c5ba3306155d8b3b1d -> rust-analyzer-20250217-84b6936.tar.gz
https://direct.funtoo.org/08/80/43/0880437da6af4ce6711144d354fdaa3511bfb1348eac0e4aaa8987465f3599a32b32c99b0be546e67a7c2ba825753e698a4b60b56fb5d9e8b4cfb05b9621baec -> rust-analyzer-20250217-funtoo-crates-bundle-61d6d2f25a6b7555a76139742a76d0128592a42422e49eda87769eaf376357206a20416a066d39db7f59c73c829c565c4548d2c84a83b9ad1b19577639c8ec9e.tar.gz"

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