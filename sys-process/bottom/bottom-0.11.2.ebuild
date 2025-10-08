# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/6dc02ea0413dc72af1d6cf84106e791361c65c3c -> bottom-0.11.2-6dc02ea.tar.gz
https://direct.funtoo.org/ca/27/ab/ca27abef311ab815db3f60e6bd47dfceb1efe17a333cc7f18258317658a2f29138b4d80088403cf72c149bebc69db8629ec5e501d5f5b0971b73e1d079a3a47a -> bottom-0.11.2-funtoo-crates-bundle-5ce352af8cb94d57b0262d6ab9b41b8bc02d109d8ebe4539cd09195f08ef99ed0428e75bede80de905c0890a8df3bd6dfad7fb30194ce6c267bf7835c8974b17.tar.gz"

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