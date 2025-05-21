# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
anstream-0.6.15
anstyle-1.0.8
anstyle-parse-0.2.5
anstyle-query-1.1.1
anstyle-wincon-3.0.4
autocfg-1.3.0
bitflags-2.6.0
cfg-if-1.0.0
clap-4.5.15
clap_builder-4.5.15
clap_lex-0.7.2
colorchoice-1.0.2
dashmap-5.5.3
diff-0.1.13
equivalent-1.0.1
errno-0.3.9
fastrand-2.1.0
hashbrown-0.14.5
heck-0.5.0
indexmap-2.3.0
is_terminal_polyfill-1.70.1
itoa-1.0.11
lazy_static-1.5.0
libc-0.2.155
linux-raw-sys-0.4.14
lock_api-0.4.12
log-0.4.22
memchr-2.7.4
once_cell-1.19.0
parking_lot-0.12.3
parking_lot_core-0.9.10
pretty_assertions-1.4.0
proc-macro2-1.0.86
quote-1.0.36
redox_syscall-0.5.3
rustix-0.38.34
ryu-1.0.18
scopeguard-1.2.0
serde-1.0.205
serde_derive-1.0.205
serde_json-1.0.122
serde_spanned-0.6.7
serial_test-2.0.0
serial_test_derive-2.0.0
smallvec-1.13.2
strsim-0.11.1
syn-2.0.85
tempfile-3.12.0
toml-0.8.19
toml_datetime-0.6.8
toml_edit-0.22.20
unicode-ident-1.0.12
utf8parse-0.2.2
windows-sys-0.52.0
windows-sys-0.59.0
windows-targets-0.52.6
windows_aarch64_gnullvm-0.52.6
windows_aarch64_msvc-0.52.6
windows_i686_gnu-0.52.6
windows_i686_gnullvm-0.52.6
windows_i686_msvc-0.52.6
windows_x86_64_gnu-0.52.6
windows_x86_64_gnullvm-0.52.6
windows_x86_64_msvc-0.52.6
winnow-0.6.18
yansi-0.5.1

"

inherit cargo rust-toolchain

DESCRIPTION="A tool for generating C bindings to Rust code"
HOMEPAGE="https://github.com//"
SRC_URI="https://api.github.com/repos/mozilla/cbindgen/tarball/0.29.0 -> cbindgen-ubuntu22.04-0.29.0.tar.gz
https://crates.io/api/v1/crates/anstream/0.6.15/download -> anstream-0.6.15.crate
https://crates.io/api/v1/crates/anstyle/1.0.8/download -> anstyle-1.0.8.crate
https://crates.io/api/v1/crates/anstyle-parse/0.2.5/download -> anstyle-parse-0.2.5.crate
https://crates.io/api/v1/crates/anstyle-query/1.1.1/download -> anstyle-query-1.1.1.crate
https://crates.io/api/v1/crates/anstyle-wincon/3.0.4/download -> anstyle-wincon-3.0.4.crate
https://crates.io/api/v1/crates/autocfg/1.3.0/download -> autocfg-1.3.0.crate
https://crates.io/api/v1/crates/bitflags/2.6.0/download -> bitflags-2.6.0.crate
https://crates.io/api/v1/crates/cfg-if/1.0.0/download -> cfg-if-1.0.0.crate
https://crates.io/api/v1/crates/clap/4.5.15/download -> clap-4.5.15.crate
https://crates.io/api/v1/crates/clap_builder/4.5.15/download -> clap_builder-4.5.15.crate
https://crates.io/api/v1/crates/clap_lex/0.7.2/download -> clap_lex-0.7.2.crate
https://crates.io/api/v1/crates/colorchoice/1.0.2/download -> colorchoice-1.0.2.crate
https://crates.io/api/v1/crates/dashmap/5.5.3/download -> dashmap-5.5.3.crate
https://crates.io/api/v1/crates/diff/0.1.13/download -> diff-0.1.13.crate
https://crates.io/api/v1/crates/equivalent/1.0.1/download -> equivalent-1.0.1.crate
https://crates.io/api/v1/crates/errno/0.3.9/download -> errno-0.3.9.crate
https://crates.io/api/v1/crates/fastrand/2.1.0/download -> fastrand-2.1.0.crate
https://crates.io/api/v1/crates/hashbrown/0.14.5/download -> hashbrown-0.14.5.crate
https://crates.io/api/v1/crates/heck/0.5.0/download -> heck-0.5.0.crate
https://crates.io/api/v1/crates/indexmap/2.3.0/download -> indexmap-2.3.0.crate
https://crates.io/api/v1/crates/is_terminal_polyfill/1.70.1/download -> is_terminal_polyfill-1.70.1.crate
https://crates.io/api/v1/crates/itoa/1.0.11/download -> itoa-1.0.11.crate
https://crates.io/api/v1/crates/lazy_static/1.5.0/download -> lazy_static-1.5.0.crate
https://crates.io/api/v1/crates/libc/0.2.155/download -> libc-0.2.155.crate
https://crates.io/api/v1/crates/linux-raw-sys/0.4.14/download -> linux-raw-sys-0.4.14.crate
https://crates.io/api/v1/crates/lock_api/0.4.12/download -> lock_api-0.4.12.crate
https://crates.io/api/v1/crates/log/0.4.22/download -> log-0.4.22.crate
https://crates.io/api/v1/crates/memchr/2.7.4/download -> memchr-2.7.4.crate
https://crates.io/api/v1/crates/once_cell/1.19.0/download -> once_cell-1.19.0.crate
https://crates.io/api/v1/crates/parking_lot/0.12.3/download -> parking_lot-0.12.3.crate
https://crates.io/api/v1/crates/parking_lot_core/0.9.10/download -> parking_lot_core-0.9.10.crate
https://crates.io/api/v1/crates/pretty_assertions/1.4.0/download -> pretty_assertions-1.4.0.crate
https://crates.io/api/v1/crates/proc-macro2/1.0.86/download -> proc-macro2-1.0.86.crate
https://crates.io/api/v1/crates/quote/1.0.36/download -> quote-1.0.36.crate
https://crates.io/api/v1/crates/redox_syscall/0.5.3/download -> redox_syscall-0.5.3.crate
https://crates.io/api/v1/crates/rustix/0.38.34/download -> rustix-0.38.34.crate
https://crates.io/api/v1/crates/ryu/1.0.18/download -> ryu-1.0.18.crate
https://crates.io/api/v1/crates/scopeguard/1.2.0/download -> scopeguard-1.2.0.crate
https://crates.io/api/v1/crates/serde/1.0.205/download -> serde-1.0.205.crate
https://crates.io/api/v1/crates/serde_derive/1.0.205/download -> serde_derive-1.0.205.crate
https://crates.io/api/v1/crates/serde_json/1.0.122/download -> serde_json-1.0.122.crate
https://crates.io/api/v1/crates/serde_spanned/0.6.7/download -> serde_spanned-0.6.7.crate
https://crates.io/api/v1/crates/serial_test/2.0.0/download -> serial_test-2.0.0.crate
https://crates.io/api/v1/crates/serial_test_derive/2.0.0/download -> serial_test_derive-2.0.0.crate
https://crates.io/api/v1/crates/smallvec/1.13.2/download -> smallvec-1.13.2.crate
https://crates.io/api/v1/crates/strsim/0.11.1/download -> strsim-0.11.1.crate
https://crates.io/api/v1/crates/syn/2.0.85/download -> syn-2.0.85.crate
https://crates.io/api/v1/crates/tempfile/3.12.0/download -> tempfile-3.12.0.crate
https://crates.io/api/v1/crates/toml/0.8.19/download -> toml-0.8.19.crate
https://crates.io/api/v1/crates/toml_datetime/0.6.8/download -> toml_datetime-0.6.8.crate
https://crates.io/api/v1/crates/toml_edit/0.22.20/download -> toml_edit-0.22.20.crate
https://crates.io/api/v1/crates/unicode-ident/1.0.12/download -> unicode-ident-1.0.12.crate
https://crates.io/api/v1/crates/utf8parse/0.2.2/download -> utf8parse-0.2.2.crate
https://crates.io/api/v1/crates/windows-sys/0.52.0/download -> windows-sys-0.52.0.crate
https://crates.io/api/v1/crates/windows-sys/0.59.0/download -> windows-sys-0.59.0.crate
https://crates.io/api/v1/crates/windows-targets/0.52.6/download -> windows-targets-0.52.6.crate
https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.52.6/download -> windows_aarch64_gnullvm-0.52.6.crate
https://crates.io/api/v1/crates/windows_aarch64_msvc/0.52.6/download -> windows_aarch64_msvc-0.52.6.crate
https://crates.io/api/v1/crates/windows_i686_gnu/0.52.6/download -> windows_i686_gnu-0.52.6.crate
https://crates.io/api/v1/crates/windows_i686_gnullvm/0.52.6/download -> windows_i686_gnullvm-0.52.6.crate
https://crates.io/api/v1/crates/windows_i686_msvc/0.52.6/download -> windows_i686_msvc-0.52.6.crate
https://crates.io/api/v1/crates/windows_x86_64_gnu/0.52.6/download -> windows_x86_64_gnu-0.52.6.crate
https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.52.6/download -> windows_x86_64_gnullvm-0.52.6.crate
https://crates.io/api/v1/crates/windows_x86_64_msvc/0.52.6/download -> windows_x86_64_msvc-0.52.6.crate
https://crates.io/api/v1/crates/winnow/0.6.18/download -> winnow-0.6.18.crate
https://crates.io/api/v1/crates/yansi/0.5.1/download -> yansi-0.5.1.crate"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT MPL-2.0 Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

QA_FLAGS_IGNORED="/usr/bin/"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/mozilla-cbindgen-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}