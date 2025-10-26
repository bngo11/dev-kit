# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/65ee50585900d9de30d48e99d03ff3e3f97ae186 -> wit-bindgen-0.47.0-65ee505.tar.gz
https://direct.funtoo.org/8a/cb/ef/8acbef4daf4a577b7b67613d2ba813c7830f7bb3b621354afbb2c2785cb9bb062b5beb274b5b3926229531ac2ba0b24de14c4af7b0fe07874add89150f3cf483 -> wit-bindgen-0.47.0-funtoo-crates-bundle-5e3658b29f9e85a8d8da685aa54528ef873c5725823dcb5fde15f44c83a7ea91d60a1b8ccaaadd74d7c363bdce9a5911d2cbc8d66b4e5ebd59a1dacbe1654573.tar.gz"

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