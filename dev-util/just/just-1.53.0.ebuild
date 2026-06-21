# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/41e7321345472555caa617ba5b36100abe407c46 -> just-1.53.0-41e7321.tar.gz
https://direct.funtoo.org/b9/35/07/b935070cf3dabc0920ded555f63fec26717ac3dc7cee0215e4a6ede7e70543fda7489bf361b88168e7617b687351d550c91eac6efa315c770b4808a350f918a2 -> just-1.53.0-funtoo-crates-bundle-027e9d5025f8ac7d5c888e28a64348c9f76ee68132fd47bbd241be58655627c625a049fd2e8004372c7c8f46ad6f6171d18c1714a699244f180584597c0acda9.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/just"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/casey-just-* ${S} || die
}

src_install() {
	cargo_src_install

	mkdir ${S}/man
	${S}/target/release/just --man > ${S}/man/just.1
	doman man/just.1

	dodoc README.md
	einstalldocs
}