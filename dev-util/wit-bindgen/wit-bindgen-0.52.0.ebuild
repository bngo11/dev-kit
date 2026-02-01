# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/3dfc82a753ac7e514802a618ddedb24dd51048fe -> wit-bindgen-0.52.0-3dfc82a.tar.gz
https://direct.funtoo.org/4a/12/c6/4a12c612188afb74cbf9495e2ff4951722c8e75ef80a8cde5f25ca391d03c8804ded7a813b63291532f7ad84a4a73064201c9a4d14126182b5b81a0b4fbf9ff5 -> wit-bindgen-0.52.0-funtoo-crates-bundle-9fcb6bbdd8921acbdc9f696077b05029a2581e640fde721b1c0728dd800a011ba9071ef97c85ab71be7777f3d45822c5f4add49fdce8783e84d603704d34e34e.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/wit-bindgen"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/bytecodealliance-wit-bindgen-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}