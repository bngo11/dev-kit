# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A tool for generating C bindings to Rust code"
HOMEPAGE="https://github.com/mozilla/cbindgen"
SRC_URI="https://github.com/mozilla/cbindgen/tarball/f43ccfc047a1a160267f32355c5e5e7154a2665a -> cbindgen-0.24.3-f43ccfc.tar.gz
https://direct.funtoo.org/9b/40/1f/9b401fd19f33123cc5308e8cc3fb3b1c82639542fe611fb0b561f9f174fbde29939c0b3e3928bdeec83da042a449d8b8005922a3f0b04e9015545cf7d13aabc9 -> cbindgen-0.24.3-funtoo-crates-bundle-b7dc73b9b35cf71d4f04967c00d68893b853a28177c6fdfa404d2e97f3630eaec5805561504dbdd66401c9dae6f9022fc7e4c02f32e2a546cd15ed114f86cc49.tar.gz"

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