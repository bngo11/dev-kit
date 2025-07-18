# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/591e3b7624be97e4443ea7b5542c191311aa141d -> rust-analyzer-20250714-591e3b7.tar.gz
https://direct.funtoo.org/f3/ab/4a/f3ab4a51baba37db04f758e36d83be64ce67cf7862cfd44e8b8b28d5b1584ae1ca7bb0edecb3fb6ad64aefe3c6e03d09dafb7a62ec9c93f0dc523dac05b74462 -> rust-analyzer-20250714-funtoo-crates-bundle-81bc8a2150d4545d344e9b328248f38c6ad742fc2b2d8dccc1abd5fefd55b3e427de94b73e8ae72cefdcfa31d29ffe0d6bd82016840417b249634097cf126b30.tar.gz"

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