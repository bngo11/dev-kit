# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/dad72a2562a0e4afbfdd52d48a58e3afdd8339d9 -> bottom-0.9.7-dad72a2.tar.gz
https://direct.funtoo.org/e7/95/b8/e795b89bda1a6734abe872b8afe635f0814358a216c9cdf5ae9784157cdb3d58f1912afc6cf3c52c6565078e6b7841fe0b5216330c8b1579790073efa0adab15 -> bottom-0.9.7-funtoo-crates-bundle-0b25110cc0f56470d4a0e805b0418748a90393eb5f58a260e8d12f17ff97ce2fd4ec3be708d88ae4774c168d874728668bd51c96de2f7141a046586024d0651d.tar.gz"

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