# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern ls with a lot of pretty colors and awesome icons"
HOMEPAGE="https://github.com/lsd-rs/lsd"
SRC_URI="https://api.github.com/repos/lsd-rs/lsd/tarball/v1.1.0 -> lsd-1.1.0.tar.gz
https://crates.io/api/v1/crates/aho-corasick/1.1.2/download -> aho-corasick-1.1.2.crate
https://crates.io/api/v1/crates/android-tzdata/0.1.1/download -> android-tzdata-0.1.1.crate
https://crates.io/api/v1/crates/android_system_properties/0.1.5/download -> android_system_properties-0.1.5.crate
https://crates.io/api/v1/crates/anstream/0.3.2/download -> anstream-0.3.2.crate
https://crates.io/api/v1/crates/anstyle/1.0.6/download -> anstyle-1.0.6.crate
https://crates.io/api/v1/crates/anstyle-parse/0.2.3/download -> anstyle-parse-0.2.3.crate
https://crates.io/api/v1/crates/anstyle-query/1.0.2/download -> anstyle-query-1.0.2.crate
https://crates.io/api/v1/crates/anstyle-wincon/1.0.2/download -> anstyle-wincon-1.0.2.crate
https://crates.io/api/v1/crates/assert_cmd/2.0.14/download -> assert_cmd-2.0.14.crate
https://crates.io/api/v1/crates/assert_fs/1.1.1/download -> assert_fs-1.1.1.crate
https://crates.io/api/v1/crates/autocfg/1.1.0/download -> autocfg-1.1.0.crate
https://crates.io/api/v1/crates/bitflags/1.3.2/download -> bitflags-1.3.2.crate
https://crates.io/api/v1/crates/bitflags/2.4.2/download -> bitflags-2.4.2.crate
https://crates.io/api/v1/crates/bstr/1.9.1/download -> bstr-1.9.1.crate
https://crates.io/api/v1/crates/bumpalo/3.15.4/download -> bumpalo-3.15.4.crate
https://crates.io/api/v1/crates/cc/1.0.90/download -> cc-1.0.90.crate
https://crates.io/api/v1/crates/cfg-if/1.0.0/download -> cfg-if-1.0.0.crate
https://crates.io/api/v1/crates/chrono/0.4.35/download -> chrono-0.4.35.crate
https://crates.io/api/v1/crates/chrono-humanize/0.2.3/download -> chrono-humanize-0.2.3.crate
https://crates.io/api/v1/crates/clap/4.3.24/download -> clap-4.3.24.crate
https://crates.io/api/v1/crates/clap_builder/4.3.24/download -> clap_builder-4.3.24.crate
https://crates.io/api/v1/crates/clap_complete/4.5.1/download -> clap_complete-4.5.1.crate
https://crates.io/api/v1/crates/clap_derive/4.3.12/download -> clap_derive-4.3.12.crate
https://crates.io/api/v1/crates/clap_lex/0.5.1/download -> clap_lex-0.5.1.crate
https://crates.io/api/v1/crates/colorchoice/1.0.0/download -> colorchoice-1.0.0.crate
https://crates.io/api/v1/crates/core-foundation-sys/0.8.6/download -> core-foundation-sys-0.8.6.crate
https://crates.io/api/v1/crates/crossbeam-deque/0.8.5/download -> crossbeam-deque-0.8.5.crate
https://crates.io/api/v1/crates/crossbeam-epoch/0.9.18/download -> crossbeam-epoch-0.9.18.crate
https://crates.io/api/v1/crates/crossbeam-utils/0.8.19/download -> crossbeam-utils-0.8.19.crate
https://crates.io/api/v1/crates/crossterm/0.27.0/download -> crossterm-0.27.0.crate
https://crates.io/api/v1/crates/crossterm_winapi/0.9.1/download -> crossterm_winapi-0.9.1.crate
https://crates.io/api/v1/crates/dashmap/5.5.3/download -> dashmap-5.5.3.crate
https://crates.io/api/v1/crates/difflib/0.4.0/download -> difflib-0.4.0.crate
https://crates.io/api/v1/crates/dirs/5.0.1/download -> dirs-5.0.1.crate
https://crates.io/api/v1/crates/dirs-sys/0.4.1/download -> dirs-sys-0.4.1.crate
https://crates.io/api/v1/crates/doc-comment/0.3.3/download -> doc-comment-0.3.3.crate
https://crates.io/api/v1/crates/equivalent/1.0.1/download -> equivalent-1.0.1.crate
https://crates.io/api/v1/crates/errno/0.3.8/download -> errno-0.3.8.crate
https://crates.io/api/v1/crates/fastrand/2.0.1/download -> fastrand-2.0.1.crate
https://crates.io/api/v1/crates/float-cmp/0.9.0/download -> float-cmp-0.9.0.crate
https://crates.io/api/v1/crates/form_urlencoded/1.2.1/download -> form_urlencoded-1.2.1.crate
https://crates.io/api/v1/crates/futures/0.3.30/download -> futures-0.3.30.crate
https://crates.io/api/v1/crates/futures-channel/0.3.30/download -> futures-channel-0.3.30.crate
https://crates.io/api/v1/crates/futures-core/0.3.30/download -> futures-core-0.3.30.crate
https://crates.io/api/v1/crates/futures-executor/0.3.30/download -> futures-executor-0.3.30.crate
https://crates.io/api/v1/crates/futures-io/0.3.30/download -> futures-io-0.3.30.crate
https://crates.io/api/v1/crates/futures-sink/0.3.30/download -> futures-sink-0.3.30.crate
https://crates.io/api/v1/crates/futures-task/0.3.30/download -> futures-task-0.3.30.crate
https://crates.io/api/v1/crates/futures-util/0.3.30/download -> futures-util-0.3.30.crate
https://crates.io/api/v1/crates/getrandom/0.2.12/download -> getrandom-0.2.12.crate
https://crates.io/api/v1/crates/git2/0.18.2/download -> git2-0.18.2.crate
https://crates.io/api/v1/crates/glob/0.3.1/download -> glob-0.3.1.crate
https://crates.io/api/v1/crates/globset/0.4.14/download -> globset-0.4.14.crate
https://crates.io/api/v1/crates/globwalk/0.9.1/download -> globwalk-0.9.1.crate
https://crates.io/api/v1/crates/hashbrown/0.14.3/download -> hashbrown-0.14.3.crate
https://crates.io/api/v1/crates/heck/0.4.1/download -> heck-0.4.1.crate
https://crates.io/api/v1/crates/hermit-abi/0.3.9/download -> hermit-abi-0.3.9.crate
https://crates.io/api/v1/crates/human-sort/0.2.2/download -> human-sort-0.2.2.crate
https://crates.io/api/v1/crates/iana-time-zone/0.1.60/download -> iana-time-zone-0.1.60.crate
https://crates.io/api/v1/crates/iana-time-zone-haiku/0.1.2/download -> iana-time-zone-haiku-0.1.2.crate
https://crates.io/api/v1/crates/idna/0.5.0/download -> idna-0.5.0.crate
https://crates.io/api/v1/crates/ignore/0.4.22/download -> ignore-0.4.22.crate
https://crates.io/api/v1/crates/indexmap/2.2.5/download -> indexmap-2.2.5.crate
https://crates.io/api/v1/crates/io-lifetimes/1.0.11/download -> io-lifetimes-1.0.11.crate
https://crates.io/api/v1/crates/is-terminal/0.4.12/download -> is-terminal-0.4.12.crate
https://crates.io/api/v1/crates/itoa/1.0.10/download -> itoa-1.0.10.crate
https://crates.io/api/v1/crates/jobserver/0.1.28/download -> jobserver-0.1.28.crate
https://crates.io/api/v1/crates/js-sys/0.3.69/download -> js-sys-0.3.69.crate
https://crates.io/api/v1/crates/lazy_static/1.4.0/download -> lazy_static-1.4.0.crate
https://crates.io/api/v1/crates/libc/0.2.153/download -> libc-0.2.153.crate
https://crates.io/api/v1/crates/libgit2-sys/0.16.2+1.7.2/download -> libgit2-sys-0.16.2+1.7.2.crate
https://crates.io/api/v1/crates/libredox/0.0.1/download -> libredox-0.0.1.crate
https://crates.io/api/v1/crates/libz-sys/1.1.15/download -> libz-sys-1.1.15.crate
https://crates.io/api/v1/crates/linked-hash-map/0.5.6/download -> linked-hash-map-0.5.6.crate
https://crates.io/api/v1/crates/linux-raw-sys/0.3.8/download -> linux-raw-sys-0.3.8.crate
https://crates.io/api/v1/crates/linux-raw-sys/0.4.13/download -> linux-raw-sys-0.4.13.crate
https://crates.io/api/v1/crates/lock_api/0.4.11/download -> lock_api-0.4.11.crate
https://crates.io/api/v1/crates/log/0.4.21/download -> log-0.4.21.crate
https://crates.io/api/v1/crates/lscolors/0.16.0/download -> lscolors-0.16.0.crate
https://crates.io/api/v1/crates/memchr/2.7.1/download -> memchr-2.7.1.crate
https://crates.io/api/v1/crates/mio/0.8.11/download -> mio-0.8.11.crate
https://crates.io/api/v1/crates/normalize-line-endings/0.3.0/download -> normalize-line-endings-0.3.0.crate
https://crates.io/api/v1/crates/nu-ansi-term/0.49.0/download -> nu-ansi-term-0.49.0.crate
https://crates.io/api/v1/crates/num-traits/0.2.18/download -> num-traits-0.2.18.crate
https://crates.io/api/v1/crates/once_cell/1.19.0/download -> once_cell-1.19.0.crate
https://crates.io/api/v1/crates/option-ext/0.2.0/download -> option-ext-0.2.0.crate
https://crates.io/api/v1/crates/parking_lot/0.12.1/download -> parking_lot-0.12.1.crate
https://crates.io/api/v1/crates/parking_lot_core/0.9.9/download -> parking_lot_core-0.9.9.crate
https://crates.io/api/v1/crates/percent-encoding/2.3.1/download -> percent-encoding-2.3.1.crate
https://crates.io/api/v1/crates/pin-project-lite/0.2.13/download -> pin-project-lite-0.2.13.crate
https://crates.io/api/v1/crates/pin-utils/0.1.0/download -> pin-utils-0.1.0.crate
https://crates.io/api/v1/crates/pkg-config/0.3.30/download -> pkg-config-0.3.30.crate
https://crates.io/api/v1/crates/predicates/3.1.0/download -> predicates-3.1.0.crate
https://crates.io/api/v1/crates/predicates-core/1.0.6/download -> predicates-core-1.0.6.crate
https://crates.io/api/v1/crates/predicates-tree/1.0.9/download -> predicates-tree-1.0.9.crate
https://crates.io/api/v1/crates/proc-macro2/1.0.78/download -> proc-macro2-1.0.78.crate
https://crates.io/api/v1/crates/pure-rust-locales/0.8.1/download -> pure-rust-locales-0.8.1.crate
https://crates.io/api/v1/crates/quote/1.0.35/download -> quote-1.0.35.crate
https://crates.io/api/v1/crates/redox_syscall/0.4.1/download -> redox_syscall-0.4.1.crate
https://crates.io/api/v1/crates/redox_users/0.4.4/download -> redox_users-0.4.4.crate
https://crates.io/api/v1/crates/regex/1.10.3/download -> regex-1.10.3.crate
https://crates.io/api/v1/crates/regex-automata/0.4.6/download -> regex-automata-0.4.6.crate
https://crates.io/api/v1/crates/regex-syntax/0.8.2/download -> regex-syntax-0.8.2.crate
https://crates.io/api/v1/crates/rustix/0.37.27/download -> rustix-0.37.27.crate
https://crates.io/api/v1/crates/rustix/0.38.31/download -> rustix-0.38.31.crate
https://crates.io/api/v1/crates/ryu/1.0.17/download -> ryu-1.0.17.crate
https://crates.io/api/v1/crates/same-file/1.0.6/download -> same-file-1.0.6.crate
https://crates.io/api/v1/crates/scopeguard/1.2.0/download -> scopeguard-1.2.0.crate
https://crates.io/api/v1/crates/serde/1.0.197/download -> serde-1.0.197.crate
https://crates.io/api/v1/crates/serde_derive/1.0.197/download -> serde_derive-1.0.197.crate
https://crates.io/api/v1/crates/serde_yaml/0.9.32/download -> serde_yaml-0.9.32.crate
https://crates.io/api/v1/crates/serial_test/2.0.0/download -> serial_test-2.0.0.crate
https://crates.io/api/v1/crates/serial_test_derive/2.0.0/download -> serial_test_derive-2.0.0.crate
https://crates.io/api/v1/crates/signal-hook/0.3.17/download -> signal-hook-0.3.17.crate
https://crates.io/api/v1/crates/signal-hook-mio/0.2.3/download -> signal-hook-mio-0.2.3.crate
https://crates.io/api/v1/crates/signal-hook-registry/1.4.1/download -> signal-hook-registry-1.4.1.crate
https://crates.io/api/v1/crates/slab/0.4.9/download -> slab-0.4.9.crate
https://crates.io/api/v1/crates/smallvec/1.13.1/download -> smallvec-1.13.1.crate
https://crates.io/api/v1/crates/strsim/0.10.0/download -> strsim-0.10.0.crate
https://crates.io/api/v1/crates/syn/2.0.52/download -> syn-2.0.52.crate
https://crates.io/api/v1/crates/sys-locale/0.3.1/download -> sys-locale-0.3.1.crate
https://crates.io/api/v1/crates/tempfile/3.10.1/download -> tempfile-3.10.1.crate
https://crates.io/api/v1/crates/term_grid/0.2.0/download -> term_grid-0.2.0.crate
https://crates.io/api/v1/crates/terminal_size/0.2.6/download -> terminal_size-0.2.6.crate
https://crates.io/api/v1/crates/terminal_size/0.3.0/download -> terminal_size-0.3.0.crate
https://crates.io/api/v1/crates/termtree/0.4.1/download -> termtree-0.4.1.crate
https://crates.io/api/v1/crates/thiserror/1.0.57/download -> thiserror-1.0.57.crate
https://crates.io/api/v1/crates/thiserror-impl/1.0.57/download -> thiserror-impl-1.0.57.crate
https://crates.io/api/v1/crates/tinyvec/1.6.0/download -> tinyvec-1.6.0.crate
https://crates.io/api/v1/crates/tinyvec_macros/0.1.1/download -> tinyvec_macros-0.1.1.crate
https://crates.io/api/v1/crates/unicode-bidi/0.3.15/download -> unicode-bidi-0.3.15.crate
https://crates.io/api/v1/crates/unicode-ident/1.0.12/download -> unicode-ident-1.0.12.crate
https://crates.io/api/v1/crates/unicode-normalization/0.1.23/download -> unicode-normalization-0.1.23.crate
https://crates.io/api/v1/crates/unicode-width/0.1.11/download -> unicode-width-0.1.11.crate
https://crates.io/api/v1/crates/unsafe-libyaml/0.2.10/download -> unsafe-libyaml-0.2.10.crate
https://crates.io/api/v1/crates/url/2.5.0/download -> url-2.5.0.crate
https://crates.io/api/v1/crates/utf8parse/0.2.1/download -> utf8parse-0.2.1.crate
https://crates.io/api/v1/crates/uzers/0.11.3/download -> uzers-0.11.3.crate
https://crates.io/api/v1/crates/vcpkg/0.2.15/download -> vcpkg-0.2.15.crate
https://crates.io/api/v1/crates/version_check/0.9.4/download -> version_check-0.9.4.crate
https://crates.io/api/v1/crates/vsort/0.2.0/download -> vsort-0.2.0.crate
https://crates.io/api/v1/crates/wait-timeout/0.2.0/download -> wait-timeout-0.2.0.crate
https://crates.io/api/v1/crates/walkdir/2.5.0/download -> walkdir-2.5.0.crate
https://crates.io/api/v1/crates/wasi/0.11.0+wasi-snapshot-preview1/download -> wasi-0.11.0+wasi-snapshot-preview1.crate
https://crates.io/api/v1/crates/wasm-bindgen/0.2.92/download -> wasm-bindgen-0.2.92.crate
https://crates.io/api/v1/crates/wasm-bindgen-backend/0.2.92/download -> wasm-bindgen-backend-0.2.92.crate
https://crates.io/api/v1/crates/wasm-bindgen-macro/0.2.92/download -> wasm-bindgen-macro-0.2.92.crate
https://crates.io/api/v1/crates/wasm-bindgen-macro-support/0.2.92/download -> wasm-bindgen-macro-support-0.2.92.crate
https://crates.io/api/v1/crates/wasm-bindgen-shared/0.2.92/download -> wasm-bindgen-shared-0.2.92.crate
https://crates.io/api/v1/crates/wild/2.2.1/download -> wild-2.2.1.crate
https://crates.io/api/v1/crates/winapi/0.3.9/download -> winapi-0.3.9.crate
https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download -> winapi-i686-pc-windows-gnu-0.4.0.crate
https://crates.io/api/v1/crates/winapi-util/0.1.6/download -> winapi-util-0.1.6.crate
https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download -> winapi-x86_64-pc-windows-gnu-0.4.0.crate
https://crates.io/api/v1/crates/windows/0.43.0/download -> windows-0.43.0.crate
https://crates.io/api/v1/crates/windows-core/0.52.0/download -> windows-core-0.52.0.crate
https://crates.io/api/v1/crates/windows-sys/0.48.0/download -> windows-sys-0.48.0.crate
https://crates.io/api/v1/crates/windows-sys/0.52.0/download -> windows-sys-0.52.0.crate
https://crates.io/api/v1/crates/windows-targets/0.48.5/download -> windows-targets-0.48.5.crate
https://crates.io/api/v1/crates/windows-targets/0.52.4/download -> windows-targets-0.52.4.crate
https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.42.2/download -> windows_aarch64_gnullvm-0.42.2.crate
https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.48.5/download -> windows_aarch64_gnullvm-0.48.5.crate
https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.52.4/download -> windows_aarch64_gnullvm-0.52.4.crate
https://crates.io/api/v1/crates/windows_aarch64_msvc/0.42.2/download -> windows_aarch64_msvc-0.42.2.crate
https://crates.io/api/v1/crates/windows_aarch64_msvc/0.48.5/download -> windows_aarch64_msvc-0.48.5.crate
https://crates.io/api/v1/crates/windows_aarch64_msvc/0.52.4/download -> windows_aarch64_msvc-0.52.4.crate
https://crates.io/api/v1/crates/windows_i686_gnu/0.42.2/download -> windows_i686_gnu-0.42.2.crate
https://crates.io/api/v1/crates/windows_i686_gnu/0.48.5/download -> windows_i686_gnu-0.48.5.crate
https://crates.io/api/v1/crates/windows_i686_gnu/0.52.4/download -> windows_i686_gnu-0.52.4.crate
https://crates.io/api/v1/crates/windows_i686_msvc/0.42.2/download -> windows_i686_msvc-0.42.2.crate
https://crates.io/api/v1/crates/windows_i686_msvc/0.48.5/download -> windows_i686_msvc-0.48.5.crate
https://crates.io/api/v1/crates/windows_i686_msvc/0.52.4/download -> windows_i686_msvc-0.52.4.crate
https://crates.io/api/v1/crates/windows_x86_64_gnu/0.42.2/download -> windows_x86_64_gnu-0.42.2.crate
https://crates.io/api/v1/crates/windows_x86_64_gnu/0.48.5/download -> windows_x86_64_gnu-0.48.5.crate
https://crates.io/api/v1/crates/windows_x86_64_gnu/0.52.4/download -> windows_x86_64_gnu-0.52.4.crate
https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.42.2/download -> windows_x86_64_gnullvm-0.42.2.crate
https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.48.5/download -> windows_x86_64_gnullvm-0.48.5.crate
https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.52.4/download -> windows_x86_64_gnullvm-0.52.4.crate
https://crates.io/api/v1/crates/windows_x86_64_msvc/0.42.2/download -> windows_x86_64_msvc-0.42.2.crate
https://crates.io/api/v1/crates/windows_x86_64_msvc/0.48.5/download -> windows_x86_64_msvc-0.48.5.crate
https://crates.io/api/v1/crates/windows_x86_64_msvc/0.52.4/download -> windows_x86_64_msvc-0.52.4.crate
https://crates.io/api/v1/crates/xattr/1.3.1/download -> xattr-1.3.1.crate
https://crates.io/api/v1/crates/xdg/2.5.2/download -> xdg-2.5.2.crate
https://crates.io/api/v1/crates/yaml-rust/0.4.5/download -> yaml-rust-0.4.5.crate"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"
IUSE="+git"

DEPEND=""
RDEPEND=""
BDEPEND=">=virtual/rust-1.31.0"

QA_FLAGS_IGNORED="/usr/bin/lsd"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lsd-rs-lsd-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}