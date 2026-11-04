# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 cargo

DESCRIPTION="A more intuitive version of du in rust"
HOMEPAGE="https://github.com/bootandy/dust"
SRC_URI="https://github.com/bootandy/dust/tarball/079c55266917387e416e0f871c97c06da52df12d -> dust-1.2.7-079c552.tar.gz
https://direct.funtoo.org/c3/46/6f/c3466fa466d358c405cb7c911ac67539e67cd7abce9558b2ff904877cee69d8a9bbc75af18ecb6ac663eda6e1bc4da10f93b139ed56823c2a0d71ae51c2721fd -> dust-1.2.7-funtoo-crates-bundle-0cc2bffdbc3cfd73763e265a58650f787b62469c339817cd088383f24bb250d5fb0490d4bc857059ba5b60dc4002ee90642e57589b5d43065bef011fa5cc13e7.tar.gz"

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