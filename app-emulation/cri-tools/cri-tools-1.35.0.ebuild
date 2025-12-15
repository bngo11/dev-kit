# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 go-module

go-module_set_globals

SRC_URI="https://github.com/kubernetes-sigs/cri-tools/tarball/46c81013b00ea238cd39499df021441ae51ec65f -> cri-tools-1.35.0-46c8101.tar.gz
https://direct.funtoo.org/51/f5/d3/51f5d3db1b1c27d202c560429904c215336a474f221ccce157c28045bfa11c0608d20f9e025cc8445e499ba4538d89c0ec4f90492988f02171187e6272802b8c -> cri-tools-1.35.0-funtoo-go-bundle-075f26597a4db93c0e08c5434175d770909678a7d9e528f06c63bc61586398408421da82fd265aaee25076b9642abcb8ec8a8288eb4b5b3d9848e208cc0ea817.tar.gz"

DESCRIPTION="CLI and validation tools for Kubelet Container Runtime (CRI)"
HOMEPAGE="https://github.com/kubernetes-sigs/cri-tools"

LICENSE="Apache-2.0 BSD BSD-2 CC-BY-SA-4.0 ISC MIT MPL-2.0"
SLOT="0"
KEYWORDS="*"

DEPEND="dev-lang/go"

RESTRICT+=" test"

src_unpack() {
	go-module_src_unpack
	if [ ! -d "${S}" ]; then
		mv kubernetes-sigs-cri-tools* "${S}" || die
	fi
}

src_compile() {
	emake VERSION="${PV}"
	./build/bin/linux/amd64/crictl completion bash > "${PN}.bash" || die
	./build/bin/linux/amd64/crictl completion zsh > "${PN}.zsh" || die
}

src_install() {
	dobin ./build/bin/linux/amd64/crictl

	newbashcomp ${PN}.bash ${PN}
	insinto /usr/share/zsh/site-functions
	newins ${PN}.zsh _${PN}

	dodoc -r docs {README,RELEASE,CHANGELOG,CONTRIBUTING}.md
}