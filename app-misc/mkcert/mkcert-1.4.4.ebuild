# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
)

go-module_set_globals

DESCRIPTION="A zero-config tool to make locally trusted development certificates"
HOMEPAGE="https://github.com/FiloSottile/mkcert"
SRC_URI="https://github.com/FiloSottile/mkcert/tarball/2a46726cebac0ff4e1f133d90b4e4c42f1edf44a -> mkcert-1.4.4-2a46726.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
	dev-libs/nss[utils]
"

post_src_unpack() {
	mv ${WORKDIR}/FiloSottile-mkcert-* ${S} || die
}

src_compile() {
	go build -tags release -ldflags "-X main.Version=${PV}"  -o ${PN} || die
}

src_install() {
	dobin mkcert
	dodoc README.md
}