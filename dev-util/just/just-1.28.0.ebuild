# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/a295ee9d428fc4f46ff9327a320fd0a2144edf34 -> just-1.28.0-a295ee9.tar.gz
https://direct.funtoo.org/16/05/08/160508f6b9bf8f32ba6d088c5e12556b704ba61af9b67ec0d95ab4fcf88bceec6286c5fd7edb4871e1f86848bc6d1af8c361a1f45437111ee490f366596aa142 -> just-1.28.0-funtoo-crates-bundle-d5e57add869b365b4fbcdbc0b9ea004f121cc331b7144449a34ffdce637abe9188045a4bbf63b894afba66d2c7068c035449872766336c697266952b026e27aa.tar.gz"

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