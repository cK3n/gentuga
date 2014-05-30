# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Deepin themes and sounds"
HOMEPAGE="http://www.linuxdeepin.com"
SRC_URI="http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-artwork/deepin-artwork_13.06.15.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="media-fonts/wqy-microhei
		media-fonts/liberation-fonts
		x11-themes/gtk-engines-unico"

src_install() {
	insinto "/"
	doins -r ${S}/etc ${S}/usr

	rm -r ${D}/etc/X11

}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }

