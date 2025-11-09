# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/e2e2bc5e22acfe2762f9db3fea60a73318d027cf -> bottom-0.11.3-e2e2bc5.tar.gz
https://direct.funtoo.org/6d/f4/93/6df4931659a029860a510a39e3275d19c8cd846467d5d839dbfd4ad7dcc3aade8932c6b3d5bc6775a6a691328e7b40b3104e9d8d93753933f5e8eb2aef2a48a3 -> bottom-0.11.3-funtoo-crates-bundle-5ce352af8cb94d57b0262d6ab9b41b8bc02d109d8ebe4539cd09195f08ef99ed0428e75bede80de905c0890a8df3bd6dfad7fb30194ce6c267bf7835c8974b17.tar.gz"

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