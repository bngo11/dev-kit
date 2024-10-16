# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools flag-o-matic linux-info readme.gentoo-r1 user

DESCRIPTION="A purely functional package manager"
HOMEPAGE="https://nixos.org/nix"

SRC_URI="https://api.github.com/repos/NixOS/nix/tarball/refs/tags/2.7.0 -> nix-2.7.0.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
IUSE="+etc-profile +gc doc s3 +sodium"

RDEPEND="
	app-arch/brotli
	app-arch/bzip2
	app-arch/xz-utils
	dev-db/sqlite
	dev-libs/editline:0=
	dev-libs/boost:0=[context]
	net-misc/curl
	sys-libs/libseccomp
	sys-libs/zlib
	gc? ( dev-libs/boehm-gc[cxx] )
	doc? ( dev-libs/libxml2
		dev-libs/libxslt
		app-text/docbook-xsl-stylesheets
	)
	s3? ( dev-libs/aws-sdk-cpp )
	sodium? ( dev-libs/libsodium:0= )
	dev-libs/openssl:0=
"
DEPEND="${RDEPEND}
	sys-devel/bison
	sys-devel/flex
	sys-devel/autoconf-archive
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}"/${PN}-bootstrap.patch
	"${FILESDIR}"/${PN}-libpaths.patch
)

DISABLE_AUTOFORMATTING=yes
DOC_CONTENTS=" Quick start user guide on Gentoo:

[as root] enable nix-daemon service:
	[systemd] # systemctl enable nix-daemon
	[openrc]  # rc-update add nix-daemon
[as a user] relogin to get environment and profile update
[as a user] fetch nixpkgs update:
	\$ nix-channel --update
[as a user] install nix packages:
	\$ nix-env -i mc
[as a user] configure environment:
	Somewhere in .bash_profile you might want to set
	LOCALE_ARCHIVE=\$HOME/.nix-profile/lib/locale/locale-archive
	but please read https://github.com/NixOS/nixpkgs/issues/21820

Next steps:
	nix package manager user manual: http://nixos.org/nix/manual/
"

pkg_pretend() {
	# USER_NS is used to run builders in a default setting in linux:
	#     https://nixos.wiki/wiki/Nix#Sandboxing
	local CONFIG_CHECK="~USER_NS"
	check_extra_config
}

pkg_setup() {
	enewgroup nixbld
	for i in {1..10}; do
		# we list 'nixbld' twice to
		# both assign a primary group for user
		# and add a user to /etc/group
		enewuser nixbld${i} -1 -1 /var/empty nixbld,nixbld
	done
}

src_prepare() {
	default

	eautoreconf
}

src_configure() {
	if ! use s3; then
		# Disable automagic depend: bug #670256
		export ac_cv_header_aws_s3_S3Client_h=no
	fi
	econf \
		--localstatedir="${EPREFIX}"/nix/var \
		$(use_enable gc)
}

src_compile() {
	emake V=1
}

src_install() {
	default

	readme.gentoo_create_doc

	# Follow the steps of 'scripts/install-multi-user.sh:create_directories()'
	local dir dirs=(
		/nix
		/nix/var
		/nix/var/log
		/nix/var/log/nix
		/nix/var/log/nix/drvs
		/nix/var/nix{,/db,/gcroots,/profiles,/temproots,/userpool}
		/nix/var/nix/{gcroots,profiles}/per-user
	)
	for dir in "${dirs[@]}"; do
		keepdir "${dir}"
		fperms 0755 "${dir}"
	done

	keepdir             /nix/store
	fowners root:nixbld /nix/store
	fperms 1775         /nix/store

	newinitd "${FILESDIR}"/nix-daemon.initd nix-daemon

	if ! use etc-profile; then
		rm "${ED}"/etc/profile.d/nix.sh || die
		rm "${ED}"/etc/profile.d/nix-daemon.sh || die
	fi
}

pkg_postinst() {
	if ! use etc-profile; then
		ewarn "${EROOT}etc/profile.d/nix.sh was removed (due to USE=-etc_profile)."
	fi

	readme.gentoo_print_elog
}