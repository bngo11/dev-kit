# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 cargo

DESCRIPTION="A more intuitive version of du in rust"
HOMEPAGE="https://github.com/bootandy/dust"
SRC_URI="https://github.com/bootandy/dust/tarball/fabe19b8de4d1d36ad55dfa28b00698bc55297e6 -> dust-1.2.4-fabe19b.tar.gz
https://direct.funtoo.org/70/15/ac/7015acd9a095a34d18958cc35eee1c0b577c99131b87a72dc55f3468bfa14ef3953f55d3d47617d5462fdbd6ffa3eafc871f3167b8fd90f5d52a8ed44842df19 -> dust-1.2.4-funtoo-crates-bundle-8b8d47a0dda14cfa8e924f7fb933e7292ccc332bb42d8691228ad2c25f22de527324508cdbb1c4d4b4f88b242833a04544cd9b0d33455fa8af491039721c3058.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/dust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/bootandy-dust-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs

	doman man-page/dust.1

	newbashcomp completions/dust.bash dust

	insinto /usr/share/fish/vendor_completions.d/
	doins completions/dust.fish
}