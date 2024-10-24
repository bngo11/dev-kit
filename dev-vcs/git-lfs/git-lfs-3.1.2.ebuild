# Distributed under the terms of the GNU General Public License v2

EAPI=7
EGO_PN=github.com/git-lfs/git-lfs
inherit go-module

DESCRIPTION="Command line extension and specification for managing large files with git"
HOMEPAGE="https://git-lfs.github.com/"

SRC_URI="https://github.com/git-lfs/git-lfs/archive/v3.1.2.tar.gz -> git-lfs-3.1.2.tar.gz"
KEYWORDS="*"

LICENSE="Apache-2.0 BSD BSD-2 BSD-4 ISC MIT"
SLOT="0"
IUSE="doc test"

BDEPEND="doc? ( app-text/ronn )"
RDEPEND="dev-vcs/git"

RESTRICT+=" !test? ( test )"

src_compile() {
	# Flags -w, -s: Omit debugging information to reduce binary size,
	# see https://golang.org/cmd/link/.
	local mygobuildargs=(
		-ldflags="-X ${EGO_PN}/config.GitCommit=${GIT_COMMIT} -s -w"
		-mod vendor -v -work -x
	)
	go build "${mygobuildargs[@]}" -o git-lfs git-lfs.go || die

	if use doc; then
		ronn docs/man/*.ronn || die "man building failed"
	fi
}

src_install() {
	dobin git-lfs
	dodoc {CHANGELOG,CODE-OF-CONDUCT,CONTRIBUTING,README}.md
	use doc && doman docs/man/*.1
}

src_test() {
	local mygotestargs=(
		-ldflags="-X ${EGO_PN}/config.GitCommit=${GIT_COMMIT}"
		-mod vendor
	)
	go test "${mygotestargs[@]}" ./... || die
}

pkg_postinst () {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog ""
		elog "Run \'git lfs install\' once for each user account manually."
		elog "For more details see https://bugs.gentoo.org/show_bug.cgi?id=733372."
	fi
}