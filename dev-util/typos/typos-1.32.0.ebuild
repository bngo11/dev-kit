# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/0f0ccba9ed1df83948f0c15026e4f5ccfce46109 -> typos-1.32.0-0f0ccba.tar.gz
https://direct.funtoo.org/d0/0e/94/d00e94da487d9a2ad633e0c2c502f398fbcb44fc252038f6521c7ef417fa263c138c29c2602c642e366c8b2f0dbb64ab8237446aa9321f8596997620e9b88491 -> typos-1.32.0-funtoo-crates-bundle-3c458f787433bba33d5cc4576ccf7babc47870137d5d27d84f98800dc16f0b78ec396753d2afe701b4a9dd32c91f35101a834876c8da70c2fdbe92bfc98f3046.tar.gz"

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