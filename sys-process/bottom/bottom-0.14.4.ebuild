# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/435369fd93b399eaa5fe6bc8a18d87186f2cb6bb -> bottom-0.14.4-435369f.tar.gz
https://direct.funtoo.org/df/44/7e/df447e560b54d0028e2d06dc8419501dfa1e10edce20cbf3f870ef6858cbb07db72687c2328401c2e36c5702f17c4da3762726f4aa9d598c8e44a23e2f73286d -> bottom-0.14.4-funtoo-crates-bundle-a5326ec41067dc9b78d54c1855371a288bcbac7e23426037fe6aa3ba62ea4256107d9bc449b33a9ff424da326b33507f0316d49fac5a8a9a1de9bdab39f8c8fc.tar.gz"

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