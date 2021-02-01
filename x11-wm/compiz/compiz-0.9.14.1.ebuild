# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Compiz Window Manager"
HOMEPAGE="https://launchpad.net/compiz"
SRC_URI="https://launchpad.net/${PN}/$(ver_cut 1-3)/${PV}/+download/${P}.tar.xz"

LICENSE="GPL-2 LGPL-2.1 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

COMMONDEPEND="
	dev-libs/boost
	dev-libs/glib:2
	dev-cpp/glibmm
	dev-libs/libxml2
	dev-libs/libxslt
	dev-libs/protobuf
	media-libs/libpng
	x11-base/xorg-server
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXinerama
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/startup-notification
	virtual/opengl
	virtual/glu
	x11-libs/gtk+:3
	x11-libs/libwnck:3
	x11-libs/pango
	x11-libs/cairo
	sys-apps/dbus
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
PYTHON_COMPAT=( python3_7 python3_8 )
PATCHES="${FILESDIR}/${P}-cmake-cython.patch"

inherit cmake python-single-r1 python-utils-r1

pkg_setup() {
	python-single-r1_pkg_setup
}

src_prepare() {
	#default
	# fix for icon paths
	sed -i 's:DataDir = "@prefix@/share":DataDir = "/usr/share":' compizconfig/ccsm/ccm/Constants.py.in
	# patch ccsm CMakeLists for cython
	#eapply -p0 "${FILESDIR}/${P}-cmake-cython.patch"
	cmake_src_prepare
}

src_configure() {
	BUILD_DIR=${WORKDIR}/build
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=${D}
		-DPYTHON_INCLUDE_DIR=$(python_get_includedir)
		-DPYTHON_LIBRARY=$(python_get_library_path)
	)
	cmake_src_configure
}

src_install() {
	pushd "${CMAKE_BUILD_DIR}"
	emake install
	popd
}

