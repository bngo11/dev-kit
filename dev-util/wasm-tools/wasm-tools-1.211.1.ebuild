# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/d4b0ccde68f35f43ea280828e9d436c903212d58 -> wasm-tools-1.211.1-d4b0ccd.tar.gz
https://direct.funtoo.org/40/9e/3f/409e3f0a8eb8f046e1b4d5beecd6fac17a4fc397987344ad254e108f7c01047cd2cac0e19409a97a18d1ce80645c28a1a1230eb6f968b80f370f7b7544781097 -> wasm-tools-1.211.1-funtoo-crates-bundle-51854f08fe5d74057b33f7536c1eb503ba2a4921ebd565c628ddad3ad591d4411b4fc41ec09b25186cd285a39eb87679b8b6e770fd06b08063dcf5c7ef141a96.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/wasm-tools"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/bytecodealliance-wasm-tools-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}