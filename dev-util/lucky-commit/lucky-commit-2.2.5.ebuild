# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Customize your git commit hashes!"
HOMEPAGE="https://github.com/not-an-aardvark/lucky-commit"
SRC_URI="https://github.com/not-an-aardvark/lucky-commit/tarball/0000000876876e416982091254f7d7c18c52001b -> lucky-commit-2.2.5-0000000.tar.gz
https://direct.funtoo.org/87/6a/ee/876aee2061984643e93761d11e662cefd72f4d5a700105725afb5653ac20a1980f11294c3b2e69246ff64a821faa6a814bb54762637eb0bac1840266979395f8 -> lucky-commit-2.2.5-funtoo-crates-bundle-937581fa411dc7b5172d5ac8f3ce4ea6b1e5ffe56f765a4e4d171ae2373ccf13b8f8da87fa45738dbf3c270e5fa54a082c5c5ea3bcf69c7965f50e8691eede63.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/lucky-commit"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/not-an-aardvark-lucky-commit-* ${S} || die
}

src_compile() {
	cargo_src_compile --no-default-features
}

src_install() {
	cargo_src_install --no-default-features
}