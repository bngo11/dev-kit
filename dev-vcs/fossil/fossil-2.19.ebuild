# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="Simple, high-reliability, source control management, and more"
HOMEPAGE="http://www.fossil-scm.org/"
SRC_URI="http://www.fossil-scm.org/home/tarball/1e131febd3fbb028d00cab6d020214e8fe36be95daaf93237523c29c542e9a5f/fossil-src-2.19.tar.gz -> fossil-2.19.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="*"
IUSE="debug fusefs json miniz system-sqlite +ssl static tcl tcl-stubs tcl-private-stubs th1-docs th1-hooks"


REQUIRED_USE="openssl? ( !miniz )"

DEPEND="
	sys-libs/zlib
	|| (
		sys-libs/readline:0
		dev-libs/libedit
	)
	system-sqlite? ( >=dev-db/sqlite-3.35.0:3 )
	ssl? ( dev-libs/openssl:0= )
	tcl? ( dev-lang/tcl:0= )
"
RDEPEND="${DEPEND}"

# Tests can't be run from the build directory
RESTRICT="test"

S="${WORKDIR}"/fossil-2.19

src_configure() {
	local myconf=""
	tc-export CC
	echo "./configure ${myconf}"
	./configure ${myconf} || die
}

src_install() {
	dobin fossil
}