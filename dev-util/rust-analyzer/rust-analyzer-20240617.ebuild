# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/6b8b8ff4c56118ddee6c531cde06add1aad4a6af -> rust-analyzer-20240617-6b8b8ff.tar.gz
https://direct.funtoo.org/d5/ab/05/d5ab05e7ff5731a672f67f1c3c17cbb79853f0fe28f81a5fede042ca1a4a60865aea66855ab0845f04ee8a5a1107ba0c756a82afbd020c4060a9f6d550265926 -> rust-analyzer-20240617-funtoo-crates-bundle-089741ce2617bb8360571526ab27f1a64bc114d4acd030b5f7fd89e252e8d26f66dcf39d6b8da56f727791da3e3fe340b97d590c43a79dd100d10c6949c80a17.tar.gz"

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