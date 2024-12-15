# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://direct.funtoo.org/e9/c0/de/e9c0de7ae7bcaf577e06ce981a7c19f9a92b23544750f6ff5e33d6820a8c8ecb672ba5e0a0d148fd0df6622db7f2d7f65fa4766b4af28cf3f964136c59cce564 -> cargo-c-0.10.7-funtoo-crates-bundle-726ccdf321ccfaaeb871014c6ffe8f0ab7314b99126d53de74cb3abe9238a4a68e94839b0de02439fb8292149c9df95c989907fae3dd2ae675df5a015d83a30f.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="sys-libs/zlib
	dev-libs/openssl:0=
	dev-vcs/git
	net-misc/curl[ssl]
"
BDEPEND="virtual/rust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lu-zero-cargo-c-* ${S} || die
}