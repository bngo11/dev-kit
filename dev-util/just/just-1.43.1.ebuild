# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/7501f68ec1ada409831c333599b9e39beb172f83 -> just-1.43.1-7501f68.tar.gz
https://direct.funtoo.org/b6/2f/7d/b62f7d2dbe19e790d4b33445231a35f43ad66a4d7dc33a7f5809a91cef46bf810699c0f4eba564ade473b9ce2ac37893c668338075ec087a19749675f86fd3db -> just-1.43.1-funtoo-crates-bundle-6c37995b002d135a054e120916cdbce7631a71a124fe292b747ecdeb8edb712aec0f6fb6b8bff7c056d12afbe78b94d4375af863b804f1d1edcbefd33d9b29c5.tar.gz"

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