# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/6bda269116363e8501f84bb296c7ec47e4ee06ad -> just-1.51.0-6bda269.tar.gz
https://direct.funtoo.org/96/f7/39/96f7390b495365bdd99b8e0acf8cd955e66ff6af26b4da13ad3deff3102deefd402fe6bf885e29f3d1b3c336d91695c5ce056755f3e9e5fe0a007d2ada79aafc -> just-1.51.0-funtoo-crates-bundle-a58d93f36bd6b03e4859ec45d17d480e7e2edb699c2f21b1db2d03f2fe64eb5e336e5e376c89201f4be4994b4d63420a72c6fe4b7a3eb2ca18a56c6aaf41f86c.tar.gz"

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