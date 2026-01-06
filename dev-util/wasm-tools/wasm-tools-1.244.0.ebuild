# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/d4e317f22c3bace76cb3205003bcc34b4929037d -> wasm-tools-1.244.0-d4e317f.tar.gz
https://direct.funtoo.org/a1/1c/eb/a11ceb1e8643433e0946dfb24c286efb0e5760014d7481eaa2f2a2d1b76c30629cfb6a6020f8e0f36b51c46f7f2a87ba8f504f5d7e48cd70fec6e5554ca46ba0 -> wasm-tools-1.244.0-funtoo-crates-bundle-93a9bf604546220c2bce09ab424a90cb518da892cfd38518dc47be7569e0d9228f65337f9f11152d4e45ab769c3c800e71b6f72f8d9411fbe496209e0711dcee.tar.gz"

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