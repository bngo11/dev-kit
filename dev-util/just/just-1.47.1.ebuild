# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/8e14fafe8a991824758c083bd60e3fcfdca3696b -> just-1.47.1-8e14faf.tar.gz
https://direct.funtoo.org/c5/a8/56/c5a8562b0e85d4d49a3ff31e84e8987220046eb61ab2d2f25d5fd3f4547ab91f6dae4fcfcc9b2329a15c377c571943e4caf506cc4fb53f63f7cc4a3bc5eacf40 -> just-1.47.1-funtoo-crates-bundle-b1f881015490bf8a0ca8c1b0bda3694a0089caf9464f3c613a90faf8767e0a08d92ca17b7ad7e6c643fa513672cf1b7da739a62ad7fa3a34d3e464c4f2ac7531.tar.gz"

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