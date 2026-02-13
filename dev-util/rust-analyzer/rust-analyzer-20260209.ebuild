# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/c75729db6845c73605115b18d819917dbf6a8972 -> rust-analyzer-20260209-c75729d.tar.gz
https://direct.funtoo.org/dc/b5/87/dcb587bd942c9faae361bf28d49f19134589d6e4b6f8b14cadc70a3c81c918d8c26e1e4b1b0ff52b650c0cd78ebdba3fd976e0e9e06b6d2aa8088bee87237b49 -> rust-analyzer-20260209-funtoo-crates-bundle-fb6169817edcd6884dd88f051abfc8a33e3dc85b922bf05de27fb04647683a94d7f173964c57b7855c9a45f229f3cc296f6321fee7d780e5ec93c3d2fa3aa74e.tar.gz"

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