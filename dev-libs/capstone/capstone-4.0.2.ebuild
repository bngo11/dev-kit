# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_OPTIONAL=1
PYTHON_COMPAT=( python3+ )

inherit cmake distutils-r1 toolchain-funcs

DESCRIPTION="disassembly/disassembler framework + bindings"
HOMEPAGE="http://www.capstone-engine.org/"
SRC_URI="https://github.com/aquynh/capstone/archive/4.0.2.tar.gz -> capstone-4.0.2.tar.gz"

LICENSE="BSD"
SLOT="0/4"
KEYWORDS="*"

RESTRICT="!test? ( test )"

IUSE="python static-libs test"
RDEPEND="python? ( ${PYTHON_DEPS} )"
DEPEND="${RDEPEND}
	python? ( dev-python/setuptools[${PYTHON_USEDEP}] )
"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

#TODO: needs upstream fixes
#distutils_enable_tests setup.py

S=${WORKDIR}/${P/_rc/-rc}

PATCHES=(
	"${FILESDIR}"/${PN}-4.0.2-libsuffix.patch
)

wrap_python() {
	local phase=$1
	shift

	if use python; then
		pushd bindings/python >/dev/null || die
		echo distutils-r1_${phase} "$@"
		pwd
		distutils-r1_${phase} "$@"
		popd >/dev/null
	fi
}

src_prepare() {
	tc-export RANLIB
	cmake_src_prepare

	wrap_python ${FUNCNAME}
}

src_configure() {
	local mycmakeargs=(
		-DCAPSTONE_BUILD_TESTS="$(usex test)"
		-DCAPSTONE_BUILD_STATIC="$(usex static-libs)"
	)
	cmake_src_configure

	wrap_python ${FUNCNAME}
}

src_compile() {
	cmake_src_compile

	wrap_python ${FUNCNAME}
}

src_test() {
	cmake_src_test

	wrap_python ${FUNCNAME}
}

src_install() {
	cmake_src_install

	wrap_python ${FUNCNAME}
}