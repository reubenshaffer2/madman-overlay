# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Themes for Emerald Window Decorator"
HOMEPAGE="https://github.com/reubenshaffer2/emerald-themes"
SRC_URI=""
EGIT_REPO_URI="https://github.com/reubenshaffer2/emerald-themes"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="x11-wm/emerald"
RDEPEND="${DEPEND}"
BDEPEND=""

inherit git-r3

src_configure() {
	cd "${WORKDIR}/${PF}"
	./autogen.sh
}


