# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 go-module

SRC_URI="https://github.com/kubernetes-sigs/cri-tools/archive/v1.23.0.tar.gz -> cri-tools-1.23.0.tar.gz
	${EGO_SUM_SRC_URI}"

DESCRIPTION="CLI and validation tools for Kubelet Container Runtime (CRI)"
HOMEPAGE="https://github.com/kubernetes-sigs/cri-tools"

LICENSE="Apache-2.0 BSD BSD-2 CC-BY-SA-4.0 ISC MIT MPL-2.0"
SLOT="0"
KEYWORDS="*"

DEPEND="dev-lang/go"

RESTRICT+=" test"

src_compile() {
	emake VERSION="${PV}"
	./build/bin/crictl completion bash > "${PN}.bash" || die
	./build/bin/crictl completion zsh > "${PN}.zsh" || die
}

src_install() {
	dobin ./build/bin/crictl

	newbashcomp ${PN}.bash ${PN}
	insinto /usr/share/zsh/site-functions
	newins ${PN}.zsh _${PN}

	dodoc -r docs {README,RELEASE,CHANGELOG,CONTRIBUTING}.md
}