# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/8a48f81b6c64dcfea44b3633223084c4be58ac5f -> typos-1.49.0-8a48f81.tar.gz
https://direct.funtoo.org/ec/4e/23/ec4e23c9d63a1488a4a9481f8bb7fdef2550fcade066ec93ef9e70111ee296b65222c96759ce3267dc66bf94acbff8f49fc875f3f7a8fa8e81356f3fc4bb3b21 -> typos-1.49.0-funtoo-crates-bundle-7289fe9b858a194b0cd4026312505748d1c96f65f296c8c0748b86850581856b4c631ad6999572fc505c3c3965d49e5a0dd09779f5481c13c8299acf8614b9df.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/typos"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/crate-ci-typos-* ${S} || die
}

src_install() {
	exeinto /usr/bin
	doexe target/release/typos

	local DOCS=(
	docs/design.md
	docs/reference.md
	CHANGELOG.md README.md
	)
	einstalldocs
}