# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="like ~~grep~~ UBER, but for binaries"
HOMEPAGE="https://github.com/m4b/bingrep"
SRC_URI="https://github.com/m4b/bingrep/tarball/7b0792f0d6853e895086b07228491c3bba82e821 -> bingrep-0.11.0-7b0792f.tar.gz
https://direct.funtoo.org/84/19/c1/8419c1bc43cf95c430eed045f62efd390544f9fcdb4226afb0c9ea332f248a948f3450e1029c9cbc94d829e5639143ca216bbc37885c674d6b13e9cf3c5a1d0b -> bingrep-0.11.0-funtoo-crates-bundle-e3dce731b5ab846ca2882efb7a166ad383bc3f503a51da993ded0ccfb2879ae15aac6993934dc786aaef0328f6943a2bf8ffb6934bf6a4632a2fa24e53b3cf96.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

QA_FLAGS_IGNORED="/usr/bin/bingrep"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/m4b-bingrep-* ${S} || die
}