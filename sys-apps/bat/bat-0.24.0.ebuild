# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 cargo rust-toolchain

DESCRIPTION=""
HOMEPAGE="https://github.com//"
SRC_URI="https://api.github.com/repos/sharkdp/bat/tarball/v0.24.0 -> bat-musl_0.24.0_amd64.deb-0.24.0.tar.gz
https://crates.io/api/v1/crates/adler/1.0.2/download -> adler-1.0.2.crate
https://crates.io/api/v1/crates/aho-corasick/0.7.19/download -> aho-corasick-0.7.19.crate
https://crates.io/api/v1/crates/aho-corasick/1.0.1/download -> aho-corasick-1.0.1.crate
https://crates.io/api/v1/crates/ansi_colours/1.2.1/download -> ansi_colours-1.2.1.crate
https://crates.io/api/v1/crates/anstream/0.6.4/download -> anstream-0.6.4.crate
https://crates.io/api/v1/crates/anstyle/0.3.5/download -> anstyle-0.3.5.crate
https://crates.io/api/v1/crates/anstyle/1.0.0/download -> anstyle-1.0.0.crate
https://crates.io/api/v1/crates/anstyle-parse/0.2.0/download -> anstyle-parse-0.2.0.crate
https://crates.io/api/v1/crates/anstyle-query/1.0.0/download -> anstyle-query-1.0.0.crate
https://crates.io/api/v1/crates/anstyle-wincon/3.0.1/download -> anstyle-wincon-3.0.1.crate
https://crates.io/api/v1/crates/assert_cmd/2.0.10/download -> assert_cmd-2.0.10.crate
https://crates.io/api/v1/crates/autocfg/1.1.0/download -> autocfg-1.1.0.crate
https://crates.io/api/v1/crates/base64/0.21.0/download -> base64-0.21.0.crate
https://crates.io/api/v1/crates/bincode/1.3.3/download -> bincode-1.3.3.crate
https://crates.io/api/v1/crates/bit-set/0.5.3/download -> bit-set-0.5.3.crate
https://crates.io/api/v1/crates/bit-vec/0.6.3/download -> bit-vec-0.6.3.crate
https://crates.io/api/v1/crates/bitflags/1.3.2/download -> bitflags-1.3.2.crate
https://crates.io/api/v1/crates/bitflags/2.4.0/download -> bitflags-2.4.0.crate
https://crates.io/api/v1/crates/bstr/1.6.0/download -> bstr-1.6.0.crate
https://crates.io/api/v1/crates/bugreport/0.5.0/download -> bugreport-0.5.0.crate
https://crates.io/api/v1/crates/bytemuck/1.12.1/download -> bytemuck-1.12.1.crate
https://crates.io/api/v1/crates/bytesize/1.3.0/download -> bytesize-1.3.0.crate
https://crates.io/api/v1/crates/cc/1.0.73/download -> cc-1.0.73.crate
https://crates.io/api/v1/crates/cfg-if/1.0.0/download -> cfg-if-1.0.0.crate
https://crates.io/api/v1/crates/clap/4.4.6/download -> clap-4.4.6.crate
https://crates.io/api/v1/crates/clap_builder/4.4.6/download -> clap_builder-4.4.6.crate
https://crates.io/api/v1/crates/clap_lex/0.5.0/download -> clap_lex-0.5.0.crate
https://crates.io/api/v1/crates/clircle/0.4.0/download -> clircle-0.4.0.crate
https://crates.io/api/v1/crates/colorchoice/1.0.0/download -> colorchoice-1.0.0.crate
https://crates.io/api/v1/crates/console/0.15.5/download -> console-0.15.5.crate
https://crates.io/api/v1/crates/content_inspector/0.2.4/download -> content_inspector-0.2.4.crate
https://crates.io/api/v1/crates/crc32fast/1.3.2/download -> crc32fast-1.3.2.crate
https://crates.io/api/v1/crates/dashmap/5.4.0/download -> dashmap-5.4.0.crate
https://crates.io/api/v1/crates/difflib/0.4.0/download -> difflib-0.4.0.crate
https://crates.io/api/v1/crates/dissimilar/1.0.5/download -> dissimilar-1.0.5.crate
https://crates.io/api/v1/crates/doc-comment/0.3.3/download -> doc-comment-0.3.3.crate
https://crates.io/api/v1/crates/dunce/1.0.3/download -> dunce-1.0.3.crate
https://crates.io/api/v1/crates/either/1.8.0/download -> either-1.8.0.crate
https://crates.io/api/v1/crates/encode_unicode/0.3.6/download -> encode_unicode-0.3.6.crate
https://crates.io/api/v1/crates/encoding_rs/0.8.33/download -> encoding_rs-0.8.33.crate
https://crates.io/api/v1/crates/equivalent/1.0.1/download -> equivalent-1.0.1.crate
https://crates.io/api/v1/crates/errno/0.3.3/download -> errno-0.3.3.crate
https://crates.io/api/v1/crates/errno-dragonfly/0.1.2/download -> errno-dragonfly-0.1.2.crate
https://crates.io/api/v1/crates/etcetera/0.8.0/download -> etcetera-0.8.0.crate
https://crates.io/api/v1/crates/expect-test/1.4.1/download -> expect-test-1.4.1.crate
https://crates.io/api/v1/crates/fancy-regex/0.7.1/download -> fancy-regex-0.7.1.crate
https://crates.io/api/v1/crates/fastrand/2.0.0/download -> fastrand-2.0.0.crate
https://crates.io/api/v1/crates/flate2/1.0.27/download -> flate2-1.0.27.crate
https://crates.io/api/v1/crates/float-cmp/0.9.0/download -> float-cmp-0.9.0.crate
https://crates.io/api/v1/crates/fnv/1.0.7/download -> fnv-1.0.7.crate
https://crates.io/api/v1/crates/form_urlencoded/1.1.0/download -> form_urlencoded-1.1.0.crate
https://crates.io/api/v1/crates/fsio/0.4.0/download -> fsio-0.4.0.crate
https://crates.io/api/v1/crates/getrandom/0.2.7/download -> getrandom-0.2.7.crate
https://crates.io/api/v1/crates/git-version/0.3.5/download -> git-version-0.3.5.crate
https://crates.io/api/v1/crates/git-version-macro/0.3.5/download -> git-version-macro-0.3.5.crate
https://crates.io/api/v1/crates/git2/0.18.0/download -> git2-0.18.0.crate
https://crates.io/api/v1/crates/glob/0.3.0/download -> glob-0.3.0.crate
https://crates.io/api/v1/crates/globset/0.4.10/download -> globset-0.4.10.crate
https://crates.io/api/v1/crates/grep-cli/0.1.9/download -> grep-cli-0.1.9.crate
https://crates.io/api/v1/crates/hashbrown/0.12.3/download -> hashbrown-0.12.3.crate
https://crates.io/api/v1/crates/hashbrown/0.14.1/download -> hashbrown-0.14.1.crate
https://crates.io/api/v1/crates/home/0.5.5/download -> home-0.5.5.crate
https://crates.io/api/v1/crates/idna/0.3.0/download -> idna-0.3.0.crate
https://crates.io/api/v1/crates/indexmap/1.9.1/download -> indexmap-1.9.1.crate
https://crates.io/api/v1/crates/indexmap/2.0.2/download -> indexmap-2.0.2.crate
https://crates.io/api/v1/crates/itertools/0.10.5/download -> itertools-0.10.5.crate
https://crates.io/api/v1/crates/itoa/1.0.3/download -> itoa-1.0.3.crate
https://crates.io/api/v1/crates/jobserver/0.1.25/download -> jobserver-0.1.25.crate
https://crates.io/api/v1/crates/lazy_static/1.4.0/download -> lazy_static-1.4.0.crate
https://crates.io/api/v1/crates/libc/0.2.147/download -> libc-0.2.147.crate
https://crates.io/api/v1/crates/libgit2-sys/0.16.1+1.7.1/download -> libgit2-sys-0.16.1+1.7.1.crate
https://crates.io/api/v1/crates/libz-sys/1.1.8/download -> libz-sys-1.1.8.crate
https://crates.io/api/v1/crates/line-wrap/0.1.1/download -> line-wrap-0.1.1.crate
https://crates.io/api/v1/crates/linked-hash-map/0.5.6/download -> linked-hash-map-0.5.6.crate
https://crates.io/api/v1/crates/linux-raw-sys/0.4.5/download -> linux-raw-sys-0.4.5.crate
https://crates.io/api/v1/crates/lock_api/0.4.9/download -> lock_api-0.4.9.crate
https://crates.io/api/v1/crates/log/0.4.17/download -> log-0.4.17.crate
https://crates.io/api/v1/crates/memchr/2.5.0/download -> memchr-2.5.0.crate
https://crates.io/api/v1/crates/miniz_oxide/0.7.1/download -> miniz_oxide-0.7.1.crate
https://crates.io/api/v1/crates/nix/0.26.2/download -> nix-0.26.2.crate
https://crates.io/api/v1/crates/normalize-line-endings/0.3.0/download -> normalize-line-endings-0.3.0.crate
https://crates.io/api/v1/crates/nu-ansi-term/0.49.0/download -> nu-ansi-term-0.49.0.crate
https://crates.io/api/v1/crates/num-traits/0.2.15/download -> num-traits-0.2.15.crate
https://crates.io/api/v1/crates/num_threads/0.1.6/download -> num_threads-0.1.6.crate
https://crates.io/api/v1/crates/once_cell/1.18.0/download -> once_cell-1.18.0.crate
https://crates.io/api/v1/crates/onig/6.4.0/download -> onig-6.4.0.crate
https://crates.io/api/v1/crates/onig_sys/69.8.1/download -> onig_sys-69.8.1.crate
https://crates.io/api/v1/crates/os_str_bytes/6.4.1/download -> os_str_bytes-6.4.1.crate
https://crates.io/api/v1/crates/parking_lot/0.12.1/download -> parking_lot-0.12.1.crate
https://crates.io/api/v1/crates/parking_lot_core/0.9.7/download -> parking_lot_core-0.9.7.crate
https://crates.io/api/v1/crates/path_abs/0.5.1/download -> path_abs-0.5.1.crate
https://crates.io/api/v1/crates/percent-encoding/2.2.0/download -> percent-encoding-2.2.0.crate
https://crates.io/api/v1/crates/pkg-config/0.3.25/download -> pkg-config-0.3.25.crate
https://crates.io/api/v1/crates/plist/1.4.3/download -> plist-1.4.3.crate
https://crates.io/api/v1/crates/ppv-lite86/0.2.17/download -> ppv-lite86-0.2.17.crate
https://crates.io/api/v1/crates/predicates/3.0.3/download -> predicates-3.0.3.crate
https://crates.io/api/v1/crates/predicates-core/1.0.6/download -> predicates-core-1.0.6.crate
https://crates.io/api/v1/crates/predicates-tree/1.0.5/download -> predicates-tree-1.0.5.crate
https://crates.io/api/v1/crates/proc-macro-hack/0.5.19/download -> proc-macro-hack-0.5.19.crate
https://crates.io/api/v1/crates/proc-macro2/1.0.66/download -> proc-macro2-1.0.66.crate
https://crates.io/api/v1/crates/quick-xml/0.28.1/download -> quick-xml-0.28.1.crate
https://crates.io/api/v1/crates/quote/1.0.26/download -> quote-1.0.26.crate
https://crates.io/api/v1/crates/rand/0.8.5/download -> rand-0.8.5.crate
https://crates.io/api/v1/crates/rand_chacha/0.3.1/download -> rand_chacha-0.3.1.crate
https://crates.io/api/v1/crates/rand_core/0.6.4/download -> rand_core-0.6.4.crate
https://crates.io/api/v1/crates/redox_syscall/0.2.16/download -> redox_syscall-0.2.16.crate
https://crates.io/api/v1/crates/redox_syscall/0.3.5/download -> redox_syscall-0.3.5.crate
https://crates.io/api/v1/crates/regex/1.8.3/download -> regex-1.8.3.crate
https://crates.io/api/v1/crates/regex-automata/0.3.7/download -> regex-automata-0.3.7.crate
https://crates.io/api/v1/crates/regex-syntax/0.6.27/download -> regex-syntax-0.6.27.crate
https://crates.io/api/v1/crates/regex-syntax/0.7.2/download -> regex-syntax-0.7.2.crate
https://crates.io/api/v1/crates/rgb/0.8.34/download -> rgb-0.8.34.crate
https://crates.io/api/v1/crates/run_script/0.10.0/download -> run_script-0.10.0.crate
https://crates.io/api/v1/crates/rustix/0.38.11/download -> rustix-0.38.11.crate
https://crates.io/api/v1/crates/ryu/1.0.11/download -> ryu-1.0.11.crate
https://crates.io/api/v1/crates/safemem/0.3.3/download -> safemem-0.3.3.crate
https://crates.io/api/v1/crates/same-file/1.0.6/download -> same-file-1.0.6.crate
https://crates.io/api/v1/crates/scopeguard/1.1.0/download -> scopeguard-1.1.0.crate
https://crates.io/api/v1/crates/semver/1.0.17/download -> semver-1.0.17.crate
https://crates.io/api/v1/crates/serde/1.0.163/download -> serde-1.0.163.crate
https://crates.io/api/v1/crates/serde_derive/1.0.163/download -> serde_derive-1.0.163.crate
https://crates.io/api/v1/crates/serde_json/1.0.85/download -> serde_json-1.0.85.crate
https://crates.io/api/v1/crates/serde_yaml/0.9.25/download -> serde_yaml-0.9.25.crate
https://crates.io/api/v1/crates/serial_test/2.0.0/download -> serial_test-2.0.0.crate
https://crates.io/api/v1/crates/serial_test_derive/2.0.0/download -> serial_test_derive-2.0.0.crate
https://crates.io/api/v1/crates/shell-escape/0.1.5/download -> shell-escape-0.1.5.crate
https://crates.io/api/v1/crates/shell-words/1.1.0/download -> shell-words-1.1.0.crate
https://crates.io/api/v1/crates/smallvec/1.10.0/download -> smallvec-1.10.0.crate
https://crates.io/api/v1/crates/static_assertions/1.1.0/download -> static_assertions-1.1.0.crate
https://crates.io/api/v1/crates/std_prelude/0.2.12/download -> std_prelude-0.2.12.crate
https://crates.io/api/v1/crates/strsim/0.10.0/download -> strsim-0.10.0.crate
https://crates.io/api/v1/crates/syn/1.0.104/download -> syn-1.0.104.crate
https://crates.io/api/v1/crates/syn/2.0.12/download -> syn-2.0.12.crate
https://crates.io/api/v1/crates/syntect/5.0.0/download -> syntect-5.0.0.crate
https://crates.io/api/v1/crates/sys-info/0.9.1/download -> sys-info-0.9.1.crate
https://crates.io/api/v1/crates/tempfile/3.8.0/download -> tempfile-3.8.0.crate
https://crates.io/api/v1/crates/termcolor/1.1.3/download -> termcolor-1.1.3.crate
https://crates.io/api/v1/crates/terminal_size/0.3.0/download -> terminal_size-0.3.0.crate
https://crates.io/api/v1/crates/termtree/0.2.4/download -> termtree-0.2.4.crate
https://crates.io/api/v1/crates/thiserror/1.0.40/download -> thiserror-1.0.40.crate
https://crates.io/api/v1/crates/thiserror-impl/1.0.40/download -> thiserror-impl-1.0.40.crate
https://crates.io/api/v1/crates/time/0.3.14/download -> time-0.3.14.crate
https://crates.io/api/v1/crates/tinyvec/1.6.0/download -> tinyvec-1.6.0.crate
https://crates.io/api/v1/crates/tinyvec_macros/0.1.0/download -> tinyvec_macros-0.1.0.crate
https://crates.io/api/v1/crates/unicode-bidi/0.3.8/download -> unicode-bidi-0.3.8.crate
https://crates.io/api/v1/crates/unicode-ident/1.0.4/download -> unicode-ident-1.0.4.crate
https://crates.io/api/v1/crates/unicode-normalization/0.1.22/download -> unicode-normalization-0.1.22.crate
https://crates.io/api/v1/crates/unicode-width/0.1.10/download -> unicode-width-0.1.10.crate
https://crates.io/api/v1/crates/unsafe-libyaml/0.2.9/download -> unsafe-libyaml-0.2.9.crate
https://crates.io/api/v1/crates/url/2.3.1/download -> url-2.3.1.crate
https://crates.io/api/v1/crates/utf8parse/0.2.1/download -> utf8parse-0.2.1.crate
https://crates.io/api/v1/crates/vcpkg/0.2.15/download -> vcpkg-0.2.15.crate
https://crates.io/api/v1/crates/wait-timeout/0.2.0/download -> wait-timeout-0.2.0.crate
https://crates.io/api/v1/crates/walkdir/2.3.3/download -> walkdir-2.3.3.crate
https://crates.io/api/v1/crates/wasi/0.11.0+wasi-snapshot-preview1/download -> wasi-0.11.0+wasi-snapshot-preview1.crate
https://crates.io/api/v1/crates/wild/2.1.0/download -> wild-2.1.0.crate
https://crates.io/api/v1/crates/winapi/0.3.9/download -> winapi-0.3.9.crate
https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download -> winapi-i686-pc-windows-gnu-0.4.0.crate
https://crates.io/api/v1/crates/winapi-util/0.1.5/download -> winapi-util-0.1.5.crate
https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download -> winapi-x86_64-pc-windows-gnu-0.4.0.crate
https://crates.io/api/v1/crates/windows-sys/0.42.0/download -> windows-sys-0.42.0.crate
https://crates.io/api/v1/crates/windows-sys/0.45.0/download -> windows-sys-0.45.0.crate
https://crates.io/api/v1/crates/windows-sys/0.48.0/download -> windows-sys-0.48.0.crate
https://crates.io/api/v1/crates/windows-targets/0.42.1/download -> windows-targets-0.42.1.crate
https://crates.io/api/v1/crates/windows-targets/0.48.0/download -> windows-targets-0.48.0.crate
https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.42.1/download -> windows_aarch64_gnullvm-0.42.1.crate
https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.48.0/download -> windows_aarch64_gnullvm-0.48.0.crate
https://crates.io/api/v1/crates/windows_aarch64_msvc/0.42.1/download -> windows_aarch64_msvc-0.42.1.crate
https://crates.io/api/v1/crates/windows_aarch64_msvc/0.48.0/download -> windows_aarch64_msvc-0.48.0.crate
https://crates.io/api/v1/crates/windows_i686_gnu/0.42.1/download -> windows_i686_gnu-0.42.1.crate
https://crates.io/api/v1/crates/windows_i686_gnu/0.48.0/download -> windows_i686_gnu-0.48.0.crate
https://crates.io/api/v1/crates/windows_i686_msvc/0.42.1/download -> windows_i686_msvc-0.42.1.crate
https://crates.io/api/v1/crates/windows_i686_msvc/0.48.0/download -> windows_i686_msvc-0.48.0.crate
https://crates.io/api/v1/crates/windows_x86_64_gnu/0.42.1/download -> windows_x86_64_gnu-0.42.1.crate
https://crates.io/api/v1/crates/windows_x86_64_gnu/0.48.0/download -> windows_x86_64_gnu-0.48.0.crate
https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.42.1/download -> windows_x86_64_gnullvm-0.42.1.crate
https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.48.0/download -> windows_x86_64_gnullvm-0.48.0.crate
https://crates.io/api/v1/crates/windows_x86_64_msvc/0.42.1/download -> windows_x86_64_msvc-0.42.1.crate
https://crates.io/api/v1/crates/windows_x86_64_msvc/0.48.0/download -> windows_x86_64_msvc-0.48.0.crate
https://crates.io/api/v1/crates/yaml-rust/0.4.5/download -> yaml-rust-0.4.5.crate"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND="
	>=dev-libs/libgit2-0.99:=
	dev-libs/oniguruma:=
	sys-libs/zlib:=
"

BDEPEND="
	virtual/pkgconfig
	virtual/rust
"

DOCS=( README.md doc/alternatives.md )

QA_FLAGS_IGNORED="/usr/bin/bat"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/sharkdp-bat-* ${S} || die
}

src_configure() {
	export RUSTONIG_SYSTEM_LIBONIG=1
	export LIBGIT2_SYS_USE_PKG_CONFIG=1
	export PKG_CONFIG_ALLOW_CROSS=1
}

src_install() {
	cargo_src_install
	einstalldocs

	# This derives the temporary build crate name where bat's
	# template generated bash completion file assets are located
	local crate_build_dir=( target/release/build/bat-*/out )

	doman "${crate_build_dir}/assets/manual/bat.1"

	newbashcomp "${crate_build_dir}/assets/completions/bat.bash" bat

	insinto /usr/share/fish/vendor_completions.d/
	doins "${crate_build_dir}/assets/completions/bat.fish"

	insinto /usr/share/zsh/site-functions/
	newins "${crate_build_dir}/assets/completions/bat.zsh" _bat

}