# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/bee27e3a4fd1ea2111cf90ab89cd076c870fce14 -> typos-1.48.0-bee27e3.tar.gz
https://direct.funtoo.org/62/7c/a4/627ca44a223bd9faf2364b3b4d81260b8cc8872642cc8b8324f66b8eb1f7c894b2e86c23078993a3ae2a3cb6889168af0f9b06e4ac9bdccc30faf858a86cd575 -> typos-1.48.0-funtoo-crates-bundle-f50d0f51874318493e1f793c6cc2c8f8c3e251a0a8262558aa00fb4fd91d9d2ed7e3cb5e24d508e2c101625b59ba16d6f4661ad8aff464e870a5213e86195928.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/typos"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/crate-ci-typos-* ${S} || die
}

src_install() {
	exeinto /usr/bin
	doexe target/release/typos

	local DOCS=(
	docs/design.md
	docs/reference.md
	CHANGELOG.md README.md
	)
	einstalldocs
}