# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 go-module

go-module_set_globals

SRC_URI="https://github.com/kubernetes-sigs/cri-tools/tarball/13496db06e3f6636a0855977dd86344698dfc501 -> cri-tools-1.37.0-13496db.tar.gz
https://direct.funtoo.org/da/23/f7/da23f77216f355931bd11feb0e28ec86dad068a75a6276d84768126a23ff1f2a255dda66edaff8cd83a78f3bd4648738a863487c5527bab7f6420045d7325c84 -> cri-tools-1.37.0-funtoo-go-bundle-6e34f3546bb6ea4f5679a27b9df045523c218805e54402d08513833e8de382c3ac857bb37588e1168a47503310e033a1a558e5cbdb81d218065aae786de269e1.tar.gz"

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