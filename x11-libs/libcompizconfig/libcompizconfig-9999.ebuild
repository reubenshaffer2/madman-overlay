# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Configuration library for Compiz Window Manager, forked from compiz-reloaded."
HOMEPAGE="https://github.com/reubenshaffer2/libcompizconfig"
SRC_URI=""
EGIT_REPO_URI="https://github.com/reubenshaffer2/libcompizconfig"

LICENSE="GPL-2 LGPL-2.1 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

COMMONDEPEND="
	dev-libs/libxml2
	x11-libs/libX11
	dev-libs/protobuf
	dev-libs/icu
	sys-libs/zlib
	x11-libs/libxcb
	x11-libs/libXau
	x11-libs/libXdmcp
"

DEPEND="${COMMONDEPEND}
	app-admin/chrpath
	virtual/pkgconfig
"

RDEPEND="${COMMONDEPEND}
	x11-apps/mesa-progs
	x11-apps/xvinfo
"
BDEPEND=""
inherit git-r3 autotools xdg-utils

src_prepare() {
	default
	eautoreconf
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}


