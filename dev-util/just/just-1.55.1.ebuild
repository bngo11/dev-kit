# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/73089009aebf1f90a7260068c984864de482eaad -> just-1.55.1-7308900.tar.gz
https://direct.funtoo.org/08/60/13/0860135ea796719f4f28ec58136c8052a5b2c02e5067ec7525264c7de407463560d76cd5b76f430595e57fce2b25c01d16c9c6ba4edeea318aaf26b68d720968 -> just-1.55.1-funtoo-crates-bundle-d924f472f949cda70f44b8f2dead19721ce6a5c30fc6c1f52c14676865c76cec7806e30d7465a6238e98f177c6b0ffa3f9de99504bc63258361aec57e59c03ca.tar.gz"

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