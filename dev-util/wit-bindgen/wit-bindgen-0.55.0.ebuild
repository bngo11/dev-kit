# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/d461cf650030db2d4daeb4a483de93ca9c092ee6 -> wit-bindgen-0.55.0-d461cf6.tar.gz
https://direct.funtoo.org/e8/15/f7/e815f7afbe4d5ac9295a607995a47356e4aceac849c2347fe21759a4fee54221333b70616c3cc3be688785763127dea99306895bfd0daeec92f2b48d48190fad -> wit-bindgen-0.55.0-funtoo-crates-bundle-5d577ae159cb945b386bb7f68259b6150b5f904a886dffd8b62e805b6f58994ea7197e74849906a41da92a1e24a7ce42e4310e23ec230f49f0b465292b0b88ce.tar.gz"

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