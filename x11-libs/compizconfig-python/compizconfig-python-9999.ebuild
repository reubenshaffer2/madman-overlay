# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Python bindings for libcompizconfig, forked from compiz-reloaded."
HOMEPAGE="https://github.com/reubenshaffer2/compizconfig-python"
SRC_URI=""
EGIT_REPO_URI="https://github.com/reubenshaffer2/compizconfig-python"
PYTHON_COMPAT=( python3_{10..13} )
LICENSE="GPL-2 LGPL-2.1 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

COMMONDEPEND="
	x11-libs/libcompizconfig
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
inherit git-r3 autotools python-r1

src_prepare() {
	default
	eautoreconf
}

