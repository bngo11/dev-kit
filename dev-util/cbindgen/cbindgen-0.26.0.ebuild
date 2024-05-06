# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
atty-0.2.14
autocfg-1.1.0
bitflags-1.3.2
cfg-if-1.0.0
clap-3.2.25
clap_lex-0.2.4
fastrand-1.9.0
hashbrown-0.12.3
heck-0.4.1
hermit-abi-0.1.19
indexmap-1.9.3
instant-0.1.12
itoa-1.0.6
lazy_static-1.4.0
libc-0.2.144
lock_api-0.4.9
log-0.4.17
os_str_bytes-6.5.0
parking_lot-0.11.2
parking_lot_core-0.8.6
proc-macro2-1.0.66
quote-1.0.27
redox_syscall-0.2.16
remove_dir_all-0.5.3
ryu-1.0.13
scopeguard-1.1.0
serde-1.0.163
serde_derive-1.0.163
serde_json-1.0.96
serial_test-0.5.1
serial_test_derive-0.5.1
smallvec-1.10.0
strsim-0.10.0
syn-1.0.109
syn-2.0.16
tempfile-3.3.0
termcolor-1.2.0
textwrap-0.16.0
toml-0.5.11
unicode-ident-1.0.8
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0

"

inherit cargo rust-toolchain

DESCRIPTION="A tool for generating C bindings to Rust code"
HOMEPAGE="https://github.com//"
SRC_URI="https://api.github.com/repos/mozilla/cbindgen/tarball/0.26.0 -> cbindgen-0.26.0.tar.gz
https://crates.io/api/v1/crates/atty/0.2.14/download -> atty-0.2.14.crate
https://crates.io/api/v1/crates/autocfg/1.1.0/download -> autocfg-1.1.0.crate
https://crates.io/api/v1/crates/bitflags/1.3.2/download -> bitflags-1.3.2.crate
https://crates.io/api/v1/crates/cfg-if/1.0.0/download -> cfg-if-1.0.0.crate
https://crates.io/api/v1/crates/clap/3.2.25/download -> clap-3.2.25.crate
https://crates.io/api/v1/crates/clap_lex/0.2.4/download -> clap_lex-0.2.4.crate
https://crates.io/api/v1/crates/fastrand/1.9.0/download -> fastrand-1.9.0.crate
https://crates.io/api/v1/crates/hashbrown/0.12.3/download -> hashbrown-0.12.3.crate
https://crates.io/api/v1/crates/heck/0.4.1/download -> heck-0.4.1.crate
https://crates.io/api/v1/crates/hermit-abi/0.1.19/download -> hermit-abi-0.1.19.crate
https://crates.io/api/v1/crates/indexmap/1.9.3/download -> indexmap-1.9.3.crate
https://crates.io/api/v1/crates/instant/0.1.12/download -> instant-0.1.12.crate
https://crates.io/api/v1/crates/itoa/1.0.6/download -> itoa-1.0.6.crate
https://crates.io/api/v1/crates/lazy_static/1.4.0/download -> lazy_static-1.4.0.crate
https://crates.io/api/v1/crates/libc/0.2.144/download -> libc-0.2.144.crate
https://crates.io/api/v1/crates/lock_api/0.4.9/download -> lock_api-0.4.9.crate
https://crates.io/api/v1/crates/log/0.4.17/download -> log-0.4.17.crate
https://crates.io/api/v1/crates/os_str_bytes/6.5.0/download -> os_str_bytes-6.5.0.crate
https://crates.io/api/v1/crates/parking_lot/0.11.2/download -> parking_lot-0.11.2.crate
https://crates.io/api/v1/crates/parking_lot_core/0.8.6/download -> parking_lot_core-0.8.6.crate
https://crates.io/api/v1/crates/proc-macro2/1.0.66/download -> proc-macro2-1.0.66.crate
https://crates.io/api/v1/crates/quote/1.0.27/download -> quote-1.0.27.crate
https://crates.io/api/v1/crates/redox_syscall/0.2.16/download -> redox_syscall-0.2.16.crate
https://crates.io/api/v1/crates/remove_dir_all/0.5.3/download -> remove_dir_all-0.5.3.crate
https://crates.io/api/v1/crates/ryu/1.0.13/download -> ryu-1.0.13.crate
https://crates.io/api/v1/crates/scopeguard/1.1.0/download -> scopeguard-1.1.0.crate
https://crates.io/api/v1/crates/serde/1.0.163/download -> serde-1.0.163.crate
https://crates.io/api/v1/crates/serde_derive/1.0.163/download -> serde_derive-1.0.163.crate
https://crates.io/api/v1/crates/serde_json/1.0.96/download -> serde_json-1.0.96.crate
https://crates.io/api/v1/crates/serial_test/0.5.1/download -> serial_test-0.5.1.crate
https://crates.io/api/v1/crates/serial_test_derive/0.5.1/download -> serial_test_derive-0.5.1.crate
https://crates.io/api/v1/crates/smallvec/1.10.0/download -> smallvec-1.10.0.crate
https://crates.io/api/v1/crates/strsim/0.10.0/download -> strsim-0.10.0.crate
https://crates.io/api/v1/crates/syn/1.0.109/download -> syn-1.0.109.crate
https://crates.io/api/v1/crates/syn/2.0.16/download -> syn-2.0.16.crate
https://crates.io/api/v1/crates/tempfile/3.3.0/download -> tempfile-3.3.0.crate
https://crates.io/api/v1/crates/termcolor/1.2.0/download -> termcolor-1.2.0.crate
https://crates.io/api/v1/crates/textwrap/0.16.0/download -> textwrap-0.16.0.crate
https://crates.io/api/v1/crates/toml/0.5.11/download -> toml-0.5.11.crate
https://crates.io/api/v1/crates/unicode-ident/1.0.8/download -> unicode-ident-1.0.8.crate
https://crates.io/api/v1/crates/winapi/0.3.9/download -> winapi-0.3.9.crate
https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download -> winapi-i686-pc-windows-gnu-0.4.0.crate
https://crates.io/api/v1/crates/winapi-util/0.1.5/download -> winapi-util-0.1.5.crate
https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download -> winapi-x86_64-pc-windows-gnu-0.4.0.crate"

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