# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

EGO_SUM=(
)

go-module_set_globals

DESCRIPTION="Run your GitHub Actions locally"
HOMEPAGE="https://github.com/nektos/act"
SRC_URI="https://github.com/nektos/act/tarball/b0d0cec71f2240fc629dcaa1889ed8c4ad52beb9 -> act-0.2.46-b0d0cec.tar.gz"

RDEPEND="
	app-emulation/docker
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

post_src_unpack() {
	mv ${WORKDIR}/nektos-act-* ${S} || die
}

src_compile() {
	go build \
		-ldflags "-X main.version=${PV}" \
		-mod=mod \
		-o ${PN} \
		main.go || die "compile failed"
}

src_install() {
	dobin ${PN}
	dodoc README.md
}