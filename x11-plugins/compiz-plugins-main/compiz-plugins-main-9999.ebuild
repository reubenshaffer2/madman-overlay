# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Main Plugins for Compiz, forked from compiz-reloaded."
HOMEPAGE="https://github.com/reubenshaffer2/compiz-plugins-main"
SRC_URI=""
EGIT_REPO_URI="https://github.com/reubenshaffer2/compiz-plugins-main"

LICENSE="GPL-2 LGPL-2.1 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

COMMONDEPEND="
	x11-libs/compiz-bcop
	x11-wm/compiz
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


