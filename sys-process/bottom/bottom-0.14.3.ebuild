# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/f17a83e90ba45dac387e77ead5a215f7dc20075b -> bottom-0.14.3-f17a83e.tar.gz
https://direct.funtoo.org/3a/e8/ab/3ae8abae0a6bf01e2bc9b3bdc9cf98f7680ae20046dfb2498409774d26898acf2b291a656b0224c2b2234fc99cc9bf5705fc6b76315079cc3f0ee6750a8de0b3 -> bottom-0.14.3-funtoo-crates-bundle-47f306c2af2913ef643b61bd7a3c54b304594754b335e3213b97320c4aa893f0f13442f3c710e85c83e785d57163b20b08794fa881d9b1241cb95a391d3ec94a.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md CHANGELOG.md )

QA_FLAGS_IGNORED="/usr/bin/btm"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/ClementTsang-bottom-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}