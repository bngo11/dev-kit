# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Yet another cross-platform graphical process/system monitor."
HOMEPAGE="https://github.com/ClementTsang/bottom"
SRC_URI="https://github.com/ClementTsang/bottom/tarball/6d251098710f3119af11ecdd8761929acb010fab -> bottom-0.9.6-6d25109.tar.gz
https://direct.funtoo.org/7d/eb/55/7deb55fa97e6b62f64ec046a712ff8daf071118c7f0da85016b2ed8ddd533df88036f798056f31fea638425251f3dc410b57733664415ab269647efc60bf4ba9 -> bottom-0.9.6-funtoo-crates-bundle-d035a407a5a09ca6b19b7db36f8b8b156c55604e17b04c04899b66150fdaf8aa9b2eea8d15f9a68d246a125d414e6b778dd40adc79227820c17d7e44b7e318b7.tar.gz"

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