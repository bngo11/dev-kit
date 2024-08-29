# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo rust-toolchain

DESCRIPTION=""
HOMEPAGE="https://github.com//"
SRC_URI="https://api.github.com/repos/sharkdp/fd/tarball/v10.2.0 -> fd-musl_10.2.0_amd64.deb-10.2.0.tar.gz
https://crates.io/api/v1/crates/aho-corasick/1.1.3/download -> aho-corasick-1.1.3.crate
https://crates.io/api/v1/crates/android-tzdata/0.1.1/download -> android-tzdata-0.1.1.crate
https://crates.io/api/v1/crates/android_system_properties/0.1.5/download -> android_system_properties-0.1.5.crate
https://crates.io/api/v1/crates/anstream/0.6.15/download -> anstream-0.6.15.crate
https://crates.io/api/v1/crates/anstyle/1.0.8/download -> anstyle-1.0.8.crate
https://crates.io/api/v1/crates/anstyle-parse/0.2.5/download -> anstyle-parse-0.2.5.crate
https://crates.io/api/v1/crates/anstyle-query/1.1.1/download -> anstyle-query-1.1.1.crate
https://crates.io/api/v1/crates/anstyle-wincon/3.0.4/download -> anstyle-wincon-3.0.4.crate
https://crates.io/api/v1/crates/anyhow/1.0.86/download -> anyhow-1.0.86.crate
https://crates.io/api/v1/crates/argmax/0.3.1/download -> argmax-0.3.1.crate
https://crates.io/api/v1/crates/autocfg/1.3.0/download -> autocfg-1.3.0.crate
https://crates.io/api/v1/crates/bitflags/1.3.2/download -> bitflags-1.3.2.crate
https://crates.io/api/v1/crates/bitflags/2.6.0/download -> bitflags-2.6.0.crate
https://crates.io/api/v1/crates/bstr/1.10.0/download -> bstr-1.10.0.crate
https://crates.io/api/v1/crates/bumpalo/3.16.0/download -> bumpalo-3.16.0.crate
https://crates.io/api/v1/crates/cc/1.1.13/download -> cc-1.1.13.crate
https://crates.io/api/v1/crates/cfg-if/1.0.0/download -> cfg-if-1.0.0.crate
https://crates.io/api/v1/crates/cfg_aliases/0.2.1/download -> cfg_aliases-0.2.1.crate
https://crates.io/api/v1/crates/chrono/0.4.38/download -> chrono-0.4.38.crate
https://crates.io/api/v1/crates/clap/4.5.16/download -> clap-4.5.16.crate
https://crates.io/api/v1/crates/clap_builder/4.5.15/download -> clap_builder-4.5.15.crate
https://crates.io/api/v1/crates/clap_complete/4.5.19/download -> clap_complete-4.5.19.crate
https://crates.io/api/v1/crates/clap_derive/4.5.13/download -> clap_derive-4.5.13.crate
https://crates.io/api/v1/crates/clap_lex/0.7.2/download -> clap_lex-0.7.2.crate
https://crates.io/api/v1/crates/colorchoice/1.0.2/download -> colorchoice-1.0.2.crate
https://crates.io/api/v1/crates/core-foundation-sys/0.8.7/download -> core-foundation-sys-0.8.7.crate
https://crates.io/api/v1/crates/crossbeam-channel/0.5.13/download -> crossbeam-channel-0.5.13.crate
https://crates.io/api/v1/crates/crossbeam-deque/0.8.5/download -> crossbeam-deque-0.8.5.crate
https://crates.io/api/v1/crates/crossbeam-epoch/0.9.18/download -> crossbeam-epoch-0.9.18.crate
https://crates.io/api/v1/crates/crossbeam-utils/0.8.20/download -> crossbeam-utils-0.8.20.crate
https://crates.io/api/v1/crates/ctrlc/3.4.5/download -> ctrlc-3.4.5.crate
https://crates.io/api/v1/crates/diff/0.1.13/download -> diff-0.1.13.crate
https://crates.io/api/v1/crates/errno/0.3.9/download -> errno-0.3.9.crate
https://crates.io/api/v1/crates/etcetera/0.8.0/download -> etcetera-0.8.0.crate
https://crates.io/api/v1/crates/faccess/0.2.4/download -> faccess-0.2.4.crate
https://crates.io/api/v1/crates/fastrand/2.1.0/download -> fastrand-2.1.0.crate
https://crates.io/api/v1/crates/filetime/0.2.24/download -> filetime-0.2.24.crate
https://crates.io/api/v1/crates/globset/0.4.14/download -> globset-0.4.14.crate
https://crates.io/api/v1/crates/heck/0.5.0/download -> heck-0.5.0.crate
https://crates.io/api/v1/crates/home/0.5.9/download -> home-0.5.9.crate
https://crates.io/api/v1/crates/humantime/2.1.0/download -> humantime-2.1.0.crate
https://crates.io/api/v1/crates/iana-time-zone/0.1.60/download -> iana-time-zone-0.1.60.crate
https://crates.io/api/v1/crates/iana-time-zone-haiku/0.1.2/download -> iana-time-zone-haiku-0.1.2.crate
https://crates.io/api/v1/crates/ignore/0.4.22/download -> ignore-0.4.22.crate
https://crates.io/api/v1/crates/is_terminal_polyfill/1.70.1/download -> is_terminal_polyfill-1.70.1.crate
https://crates.io/api/v1/crates/jemalloc-sys/0.5.4+5.3.0-patched/download -> jemalloc-sys-0.5.4+5.3.0-patched.crate
https://crates.io/api/v1/crates/jemallocator/0.5.4/download -> jemallocator-0.5.4.crate
https://crates.io/api/v1/crates/js-sys/0.3.70/download -> js-sys-0.3.70.crate
https://crates.io/api/v1/crates/lazy_static/1.5.0/download -> lazy_static-1.5.0.crate
https://crates.io/api/v1/crates/libc/0.2.158/download -> libc-0.2.158.crate
https://crates.io/api/v1/crates/libredox/0.1.3/download -> libredox-0.1.3.crate
https://crates.io/api/v1/crates/linux-raw-sys/0.4.14/download -> linux-raw-sys-0.4.14.crate
https://crates.io/api/v1/crates/log/0.4.22/download -> log-0.4.22.crate
https://crates.io/api/v1/crates/lscolors/0.19.0/download -> lscolors-0.19.0.crate
https://crates.io/api/v1/crates/memchr/2.7.4/download -> memchr-2.7.4.crate
https://crates.io/api/v1/crates/nix/0.24.3/download -> nix-0.24.3.crate
https://crates.io/api/v1/crates/nix/0.29.0/download -> nix-0.29.0.crate
https://crates.io/api/v1/crates/normpath/1.3.0/download -> normpath-1.3.0.crate
https://crates.io/api/v1/crates/nu-ansi-term/0.50.1/download -> nu-ansi-term-0.50.1.crate
https://crates.io/api/v1/crates/num-traits/0.2.19/download -> num-traits-0.2.19.crate
https://crates.io/api/v1/crates/once_cell/1.19.0/download -> once_cell-1.19.0.crate
https://crates.io/api/v1/crates/proc-macro2/1.0.86/download -> proc-macro2-1.0.86.crate
https://crates.io/api/v1/crates/quote/1.0.36/download -> quote-1.0.36.crate
https://crates.io/api/v1/crates/redox_syscall/0.5.3/download -> redox_syscall-0.5.3.crate
https://crates.io/api/v1/crates/regex/1.10.6/download -> regex-1.10.6.crate
https://crates.io/api/v1/crates/regex-automata/0.4.7/download -> regex-automata-0.4.7.crate
https://crates.io/api/v1/crates/regex-syntax/0.8.4/download -> regex-syntax-0.8.4.crate
https://crates.io/api/v1/crates/rustix/0.38.34/download -> rustix-0.38.34.crate
https://crates.io/api/v1/crates/same-file/1.0.6/download -> same-file-1.0.6.crate
https://crates.io/api/v1/crates/serde/1.0.208/download -> serde-1.0.208.crate
https://crates.io/api/v1/crates/serde_derive/1.0.208/download -> serde_derive-1.0.208.crate
https://crates.io/api/v1/crates/shlex/1.3.0/download -> shlex-1.3.0.crate
https://crates.io/api/v1/crates/strsim/0.11.1/download -> strsim-0.11.1.crate
https://crates.io/api/v1/crates/syn/2.0.75/download -> syn-2.0.75.crate
https://crates.io/api/v1/crates/tempfile/3.12.0/download -> tempfile-3.12.0.crate
https://crates.io/api/v1/crates/terminal_size/0.3.0/download -> terminal_size-0.3.0.crate
https://crates.io/api/v1/crates/test-case/3.3.1/download -> test-case-3.3.1.crate
https://crates.io/api/v1/crates/test-case-core/3.3.1/download -> test-case-core-3.3.1.crate
https://crates.io/api/v1/crates/test-case-macros/3.3.1/download -> test-case-macros-3.3.1.crate
https://crates.io/api/v1/crates/unicode-ident/1.0.12/download -> unicode-ident-1.0.12.crate
https://crates.io/api/v1/crates/utf8parse/0.2.2/download -> utf8parse-0.2.2.crate
https://crates.io/api/v1/crates/version_check/0.9.5/download -> version_check-0.9.5.crate
https://crates.io/api/v1/crates/walkdir/2.5.0/download -> walkdir-2.5.0.crate
https://crates.io/api/v1/crates/wasm-bindgen/0.2.93/download -> wasm-bindgen-0.2.93.crate
https://crates.io/api/v1/crates/wasm-bindgen-backend/0.2.93/download -> wasm-bindgen-backend-0.2.93.crate
https://crates.io/api/v1/crates/wasm-bindgen-macro/0.2.93/download -> wasm-bindgen-macro-0.2.93.crate
https://crates.io/api/v1/crates/wasm-bindgen-macro-support/0.2.93/download -> wasm-bindgen-macro-support-0.2.93.crate
https://crates.io/api/v1/crates/wasm-bindgen-shared/0.2.93/download -> wasm-bindgen-shared-0.2.93.crate
https://crates.io/api/v1/crates/winapi/0.3.9/download -> winapi-0.3.9.crate
https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download -> winapi-i686-pc-windows-gnu-0.4.0.crate
https://crates.io/api/v1/crates/winapi-util/0.1.9/download -> winapi-util-0.1.9.crate
https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download -> winapi-x86_64-pc-windows-gnu-0.4.0.crate
https://crates.io/api/v1/crates/windows-core/0.52.0/download -> windows-core-0.52.0.crate
https://crates.io/api/v1/crates/windows-sys/0.48.0/download -> windows-sys-0.48.0.crate
https://crates.io/api/v1/crates/windows-sys/0.52.0/download -> windows-sys-0.52.0.crate
https://crates.io/api/v1/crates/windows-sys/0.59.0/download -> windows-sys-0.59.0.crate
https://crates.io/api/v1/crates/windows-targets/0.48.5/download -> windows-targets-0.48.5.crate
https://crates.io/api/v1/crates/windows-targets/0.52.6/download -> windows-targets-0.52.6.crate
https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.48.5/download -> windows_aarch64_gnullvm-0.48.5.crate
https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.52.6/download -> windows_aarch64_gnullvm-0.52.6.crate
https://crates.io/api/v1/crates/windows_aarch64_msvc/0.48.5/download -> windows_aarch64_msvc-0.48.5.crate
https://crates.io/api/v1/crates/windows_aarch64_msvc/0.52.6/download -> windows_aarch64_msvc-0.52.6.crate
https://crates.io/api/v1/crates/windows_i686_gnu/0.48.5/download -> windows_i686_gnu-0.48.5.crate
https://crates.io/api/v1/crates/windows_i686_gnu/0.52.6/download -> windows_i686_gnu-0.52.6.crate
https://crates.io/api/v1/crates/windows_i686_gnullvm/0.52.6/download -> windows_i686_gnullvm-0.52.6.crate
https://crates.io/api/v1/crates/windows_i686_msvc/0.48.5/download -> windows_i686_msvc-0.48.5.crate
https://crates.io/api/v1/crates/windows_i686_msvc/0.52.6/download -> windows_i686_msvc-0.52.6.crate
https://crates.io/api/v1/crates/windows_x86_64_gnu/0.48.5/download -> windows_x86_64_gnu-0.48.5.crate
https://crates.io/api/v1/crates/windows_x86_64_gnu/0.52.6/download -> windows_x86_64_gnu-0.52.6.crate
https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.48.5/download -> windows_x86_64_gnullvm-0.48.5.crate
https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.52.6/download -> windows_x86_64_gnullvm-0.52.6.crate
https://crates.io/api/v1/crates/windows_x86_64_msvc/0.48.5/download -> windows_x86_64_msvc-0.48.5.crate
https://crates.io/api/v1/crates/windows_x86_64_msvc/0.52.6/download -> windows_x86_64_msvc-0.52.6.crate"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="${DEPEND}"
DEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/sharkdp-fd-* ${S} || die
}

src_compile() {
	# https://bugs.funtoo.org/browse/FL-10663
	# If we want bash and fish shell completions we have to
	# reverse engineer components of this Makefile from upstream
	# into this ebuild: https://github.com/sharkdp/fd/blob/master/Makefile
	#
	# After fd v8.5.0, bash and fish shell completion is being handled directly
	# by the fd Rust binary itself, specifically the clap_complete feature of the clap Crate
	#
	# These shell completion files can now be dynamically generated  with:
	# fd --gen-completions bash
	# fd --gen-completions fish
	#
	# The problem is the absolute pathing to the fd binary in those auto-generated
	# completion files needs to be correct relative to the Funtoo install in this ebuild
	cargo_src_compile
}

src_install() {
	cargo_src_install

	insinto /usr/share/zsh/site-functions
	doins contrib/completion/_fd
	dodoc README.md
	doman doc/fd.1
}