# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/a926d847c41399a7c4053172e13ff7acac1e8965 -> just-1.29.0-a926d84.tar.gz
https://direct.funtoo.org/2b/42/4f/2b424f6f509ec3f11e050df50bc90f828b70994c63e1605955b7e4f38d4eaf95c3bff89f62be88332f264c29c0b3582a33531d045dde8c84c25c2931b77d5ed7 -> just-1.29.0-funtoo-crates-bundle-c4a19031766b66b9ed7e2f2db2d4034e3ca37e662da0e2eef00567b36c75ec7b445746d44223949bd001c9bc996bdc6bb5094c0c45e1fe4b8e890c01d73b2da0.tar.gz"

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

src_configure() {
	# FL-10339 workaround
	# upstream man directory for some reason errors with the doman eclass function:
	# install-xattr: failed to stat /var/tmp/portage/dev-util/just-1.25.2/image/usr/share/man/man2/man: No such file or directory
	mv ${S}/man ${S}/man.tmp || die
}

src_install() {
	cargo_src_install

	doman man.tmp/*

	dodoc README.md
	einstalldocs
}