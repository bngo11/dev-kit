# dev-kit/curated:dev-libs/botan
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3+ )

inherit python-r1 toolchain-funcs

DESCRIPTION="C++ crypto library"
SRC_URI="https://github.com/randombit/botan/tarball/51b06ca93d1998d19927699f78b8d67539148dde -> botan-3.0.0-51b06ca.tar.gz"

HOMEPAGE="https://botan.randombit.net/"

LICENSE="BSD-2"
# Major versions are parallel-installable
SLOT="3/3.0"
KEYWORDS="*"
IUSE="boost bzip2 doc lzma python static-libs sqlite test tools zlib"
RESTRICT="!test? ( test )"

CPU_USE=(
	cpu_flags_arm_{aes,neon}
	cpu_flags_ppc_altivec
	cpu_flags_x86_{aes,avx2,popcnt,rdrand,sha,sse2,ssse3,sse4_1,sse4_2}
)

IUSE+=" ${CPU_USE[@]}"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

# NOTE: Boost is needed at runtime too for the CLI tool.
DEPEND="
	boost? ( dev-libs/boost:= )
	bzip2? ( >=app-arch/bzip2-1.0.5:= )
	zlib? ( >=sys-libs/zlib-1.2.3:= )
	lzma? ( app-arch/xz-utils:= )
	python? ( ${PYTHON_DEPS} )
	sqlite? ( dev-db/sqlite:3= )
"
RDEPEND="${DEPEND}"
BDEPEND="
	${PYTHON_DEPS}
	$(python_gen_any_dep '
		doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	')
"

python_check_deps() {
	use doc || return 0
	python_has_version "dev-python/sphinx[${PYTHON_USEDEP}]"
}

post_src_unpack() {
	if [ ! -d "${S}" ]; then
		mv randombit-botan-* "${S}" || die
	fi
}

src_configure() {
	python_setup

	local disable_modules=(
		$(usev !boost 'boost')
	)

	if [[ -z "${DISABLE_MODULES}" ]] ; then
		elog "Disabling module(s): ${disable_modules[@]}"
	fi

	local chostarch="${CHOST%%-*}"

	# Arch specific wrangling
	local myos=
	case ${CHOST} in
		*-darwin*)
			myos=darwin
			;;
		*)
			myos=linux

			if [[ ${CHOST} == *hppa* ]] ; then
				chostarch=parisc
			elif [[ ${ABI} == sparc64 ]] ; then
				chostarch="sparc64"
			elif [[ ${ABI} == sparc32 ]] ; then
				chostarch="sparc32"
			fi
			;;
	esac

	local pythonvers=()
	if use python ; then
		_append() {
			pythonvers+=( ${EPYTHON/python/} )
		}

		python_foreach_impl _append
	fi

	local myargs=(
		# Intrinsics
		# TODO: x86 RDSEED (new CPU_FLAGS_X86?)
		# TODO: POWER Crypto (new CPU_FLAGS_PPC?)
		#$(usev !cpu_flags_arm_aes '--disable-armv8crypto')
		#$(usev !cpu_flags_arm_neon '--disable-neon')
		#$(usev !cpu_flags_ppc_altivec '--disable-altivec')
		#$(usev !cpu_flags_x86_aes '--disable-aes-ni')
		#$(usev !cpu_flags_x86_avx2 '--disable-avx2')
		#$(usev !cpu_flags_x86_popcnt '--disable-bmi2')
		#$(usev !cpu_flags_x86_rdrand '--disable-rdrand')
		#$(usev !cpu_flags_x86_sha '--disable-sha-ni')
		#$(usev !cpu_flags_x86_sse2 '--disable-sse2')
		#$(usev !cpu_flags_x86_ssse3 '--disable-ssse3')
		#$(usev !cpu_flags_x86_sse4_1 '--disable-sse4.1')
		#$(usev !cpu_flags_x86_sse4_2 '--disable-sse4.2')

		# HPPA's GCC doesn't support SSP (presumably due to stack direction)
		$(usev hppa '--without-stack-protector')

		$(use_with boost)
		$(use_with bzip2)
		$(use_with doc documentation)
		$(use_with doc sphinx)
		$(use_with lzma)
		$(use_enable static-libs static-library)
		$(use_with sqlite sqlite3)
		$(use_with zlib)

		--cpu=${chostarch}
		--docdir=share/doc
		--disable-modules=$(IFS=","; echo "${disable_modules[*]}")
		--distribution-info="Gentoo ${PVR}"
		--libdir="$(get_libdir)"

		# Don't install Python bindings automatically
		# (do it manually later in the right place)
		# bug #723096
		--no-install-python-module

		--os=${myos}
		--prefix="${EPREFIX}"/usr
		--with-endian="$(tc-endian)"
		--with-python-version=$(IFS=","; echo "${pythonvers[*]}")
	)

	local build_targets=(
		shared
		$(usev static-libs static)
		$(usev tools cli)
		$(usev test tests)
	)

	myargs+=(
		--build-targets=$(IFS=","; echo "${build_targets[*]}")
	)

	if use elibc_glibc && use kernel_linux ; then
		myargs+=(
			--with-os-features=getrandom,getentropy
		)
	fi

	tc-export AR CC CXX

	${EPYTHON} configure.py --verbose "${myargs[@]}"
}

src_test() {
	LD_LIBRARY_PATH="${S}" ./botan-test || die "Validation tests failed"
}

src_install() {
	default

	# Manually install the Python bindings (bug #723096)
	if use python ; then
		python_foreach_impl python_domodule src/python/botan$(ver_cut 1).py
	fi
}