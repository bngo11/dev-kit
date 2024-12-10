# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 go-module

go-module_set_globals

SRC_URI="https://github.com/kubernetes-sigs/cri-tools/tarball/b5cf674bb19f574ee488c991ac813c76c08eedaf -> cri-tools-1.32.0-b5cf674.tar.gz
https://direct.funtoo.org/5a/7a/e2/5a7ae2f562597b5c55e41866ae8d674d13481bc2c3a49d930fbfaf3f70ef7286a9b26882352e4583f06cc7612f63eac095e21967c7243c0a384f872cc50342c9 -> cri-tools-1.32.0-funtoo-go-bundle-9ffb872fa2e3ed538404e1aefde2233a44ae97307dea0cf7a79a999e6b85cfffd4df2e09321c58cbd037142135c9562a0b03d6e54ce089c630b4b0ad631423d9.tar.gz"

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