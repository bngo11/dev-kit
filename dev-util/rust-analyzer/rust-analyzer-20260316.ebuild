# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/90c8906e6443e7cee18cece9c2621a8b1c10794c -> rust-analyzer-20260316-90c8906.tar.gz
https://direct.funtoo.org/91/dd/74/91dd7410962619ed94860fc3d8442fed24787083e83e7539e51ca985de466e2a44338e856b2daf0f4ff1ce2559bcb37b5580078a8ffe2d3c35517be8194c3a4d -> rust-analyzer-20260316-funtoo-crates-bundle-7c924d7b70d387c37d2193bd93991a37f2bffe77e2c74690c6b8938ba951a2cc390355123a9b0b8e07ee6dc4a50e23b167401ad630c44257968f596153e56891.tar.gz"

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