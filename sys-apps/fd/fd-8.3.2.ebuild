# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
aho-corasick-0.7.18
ansi_term-0.12.1
anyhow-1.0.52
atty-0.2.14
autocfg-1.0.1
bitflags-1.3.2
bstr-0.2.17
cc-1.0.72
cfg-if-1.0.0
chrono-0.4.19
clap-3.0.5
clap_complete-3.0.2
crossbeam-utils-0.8.5
ctrlc-3.2.1
diff-0.1.12
dirs-next-2.0.0
dirs-sys-next-0.1.2
filetime-0.2.15
fnv-1.0.7
fs_extra-1.2.0
fuchsia-cprng-0.1.1
getrandom-0.2.3
globset-0.4.8
hashbrown-0.11.2
hermit-abi-0.1.19
humantime-2.1.0
ignore-0.4.18
indexmap-1.8.0
jemalloc-sys-0.3.2
jemallocator-0.3.2
lazy_static-1.4.0
libc-0.2.112
log-0.4.14
lscolors-0.8.1
memchr-2.4.1
memoffset-0.6.5
nix-0.23.1
normpath-0.3.2
num-integer-0.1.44
num-traits-0.2.14
num_cpus-1.13.1
once_cell-1.9.0
os_str_bytes-6.0.0
proc-macro2-1.0.36
quote-1.0.14
rand-0.4.6
rand_core-0.3.1
rand_core-0.4.2
rdrand-0.4.0
redox_syscall-0.2.10
redox_users-0.4.0
regex-1.5.4
regex-syntax-0.6.25
remove_dir_all-0.5.3
same-file-1.0.6
strsim-0.10.0
syn-1.0.85
tempdir-0.3.7
termcolor-1.1.2
terminal_size-0.1.17
test-case-1.2.1
textwrap-0.14.2
thread_local-1.1.3
time-0.1.43
unicode-xid-0.2.2
users-0.11.0
version_check-0.9.4
walkdir-2.3.2
wasi-0.10.2+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit bash-completion-r1 cargo

DESCRIPTION="Alternative to find that provides sensible defaults for 80% of the use cases"
HOMEPAGE="https://github.com/sharkdp/fd"
SRC_URI="https://api.github.com/repos/sharkdp/fd/tarball/v8.3.2 -> fd-8.3.2.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=">=virtual/rust-1.31.0"
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="/usr/bin/fd"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/sharkdp-fd-* ${S} || die
}

src_compile() {
	export SHELL_COMPLETIONS_DIR="${T}/shell_completions"
	cargo_src_compile
}

src_install() {
	cargo_src_install

	newbashcomp "${T}"/shell_completions/fd.bash fd
	insinto /usr/share/zsh/site-functions
	doins "${S}"/contrib/completion/_fd
	insinto /usr/share/fish/vendor_completions.d
	doins "${T}"/shell_completions/fd.fish
	dodoc README.md
	doman doc/*.1
}