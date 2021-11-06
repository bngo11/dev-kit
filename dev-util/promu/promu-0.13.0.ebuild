# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module

DESCRIPTION="Prometheus Utility Tool"
HOMEPAGE="https://github.com/prometheus/promu"
SRC_URI="https://github.com/prometheus/promu/archive/v0.13.0.tar.gz -> promu-0.13.0.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE=""

RESTRICT+="test network-sandbox"

src_compile() {
	go build -work . || die "compile failed"
}

src_install() {
	dobin ${PN}
	dodoc -r {doc,{README,CONTRIBUTING}.md}
}