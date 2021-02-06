# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Emerald Window Decorator"
HOMEPAGE="https://github.com/reubenshaffer2/emerald"
SRC_URI=""
EGIT_REPO_URI="https://github.com/reubenshaffer2/emerald"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="x11-wm/compiz"
RDEPEND="${DEPEND}"
BDEPEND=""

inherit git-r3 autotools xdg-utils

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf --prefix=/usr/local
}

pkg_postinst() {
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
	xdg_desktop_database_update
}

