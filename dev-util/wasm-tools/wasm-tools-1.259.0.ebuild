# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/7fc33f279ec4fb3bf0623a14d388725ee8a1ce65 -> wasm-tools-1.259.0-7fc33f2.tar.gz
https://direct.funtoo.org/3e/7e/16/3e7e16c46838b47204e5e6b1397bc6eed304c718839174cab4c08bb79ef1ab8d5c84a5c51d494dcb3208ae80c2c94a49759faf6af94d69c7f4efb581dcddb264 -> wasm-tools-1.259.0-funtoo-crates-bundle-2cdb44efe6794155bd7472cdbf46ec17eee40acc501f37e0fe733922fc7d2ddb9adf79d07a1642a431714d1047614b30da6e6467d4d9aa89538c8cb25bbbd514.tar.gz"

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