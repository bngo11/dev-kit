# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/b0632f749e6abf0f82f71755d7eaca4884c1a808 -> rust-analyzer-20250317-b0632f7.tar.gz
https://direct.funtoo.org/31/10/de/3110dec17c2c9fe09913b651e8ce7248996f7722c059da0ce6d0965f2087a32dae49ee40cfd4314533663c4e02f65646b74af29000726f24eb161a201061eab8 -> rust-analyzer-20250317-funtoo-crates-bundle-d672db9af23527addbd3a8f1b73774473f8ffed3a51b3b7c6ffe6c4f89d3a5a3d4940f61553a83b09c148f4dbce26488eb197cd49c34c7b74fb6d13a27d72e0f.tar.gz"

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