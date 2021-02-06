# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Configuration application for Compiz, forked from compiz-reloaded."
HOMEPAGE="https://github.com/reubenshaffer2/ccsm"
SRC_URI=""
EGIT_REPO_URI="https://github.com/reubenshaffer2/ccsm"

LICENSE="GPL-2 LGPL-2.1 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

COMMONDEPEND="
	x11-libs/compizconfig-python
	x11-libs/gtk+:3
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

src_install() {
	python setup.py install --prefix=/usr
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}


