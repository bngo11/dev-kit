# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A tool for generating C bindings to Rust code"
HOMEPAGE="https://github.com/mozilla/cbindgen"
SRC_URI="https://github.com/mozilla/cbindgen/tarball/dd9a550152cd162a3aa01757a55dd22fc56d0d8a -> cbindgen-0.25.0-dd9a550.tar.gz
https://direct.funtoo.org/37/22/21/372221540ae7009c5c98cdc204232867ac5fe81b41c9aaa1700666cee1e1fa06d03e73acf35dbdea0757e5d17f861f6fcdb37b591778e3431127ecf9fd4d66db -> cbindgen-0.25.0-funtoo-crates-bundle-f2f57b026a06a034dc7a8451d216c48e1bf5a574297a66b0416dabb3146102549a071def72d4e855a4bc4757115fb3f5576db9fb35b2026cb10dfb7d42f3eed4.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT MPL-2.0 Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

QA_FLAGS_IGNORED="/usr/bin/cbindgen"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/mozilla-cbindgen-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}