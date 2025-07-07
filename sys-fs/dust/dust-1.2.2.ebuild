# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 cargo

DESCRIPTION="A more intuitive version of du in rust"
HOMEPAGE="https://github.com/bootandy/dust"
SRC_URI="https://github.com/bootandy/dust/tarball/b5b9f4196f03ccd61b84ef2c1dc653e9c905bccf -> dust-1.2.2-b5b9f41.tar.gz
https://direct.funtoo.org/94/ea/90/94ea90385a39299cd086eb9845b35094861c38cf63e197e29cec01b490f8c9c3ce02193d7d1cc81f603402928ddc67d24dbff5f0ea042f89f44822702cd4eba7 -> dust-1.2.2-funtoo-crates-bundle-9f65744c7426722ce2beaf15f881a84c97c8bb5c888c5ef52017038817838906fcb181c4c84674727d8946d7c56677a13a6a3f07006203625dd9dbefcd581b81.tar.gz"

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