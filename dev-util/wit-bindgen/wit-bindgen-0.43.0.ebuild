# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/71330dc0b891878e050281c7e9af94767244db4e -> wit-bindgen-0.43.0-71330dc.tar.gz
https://direct.funtoo.org/9f/d3/5c/9fd35c81cc0a968d2adb7a1b78ebc07d1dea639fac85cda5d2b28553e3b17388c0b51cfa9718045f4744d1c312e4cebd8fa9303e760b0c17574518b15c9f7bed -> wit-bindgen-0.43.0-funtoo-crates-bundle-ac8fedf17f315fb35509479e79111501e76e1ba7ccc93a91cd5574ebeec62ea0c10790752b08ed85e718bdd6662376d9cd0bfdceb70ab177d87351100a97b590.tar.gz"

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