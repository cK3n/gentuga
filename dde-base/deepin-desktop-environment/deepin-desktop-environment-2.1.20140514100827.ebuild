# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils versionator

MY_VER="$(get_version_component_range 1-2)+git$(get_version_component_range 3)~04659e085e"

DESCRIPTION="basic modules and resources for Deepin Desktop Environment"
HOMEPAGE="http://www.linuxdeepin.com"
SRC_URI="http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-desktop-environment/deepin-desktop-environment_2.1-20140514100827~1c16f90151.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Need dev-lang/coffee-script from eva overlay
DEPEND="dde-base/deepin-webkit
		x11-libs/gtk+:3
		net-libs/webkit-gtk:3
		x11-libs/gdk-pixbuf:2
		gnome-base/gnome-desktop:3
		gnome-base/gnome-keyring
		gnome-base/gnome-menus
		gnome-base/gvfs
		=gnome-base/nautilus-3.10.51
		net-analyzer/gnome-nettool
		gnome-extra/gnome-power-manager
		gnome-extra/gnome-screensaver
		sys-auth/rtkit
		dev-libs/dbus-glib
		dev-db/sqlite:3
		dev-libs/glib:2
		x11-misc/lightdm
		>=x11-wm/compiz-0.9.8[gnome]
		dev-lang/coffee-script"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}-${MY_VER}

src_install() {
	cmake-utils_src_install 

	insinto "/usr/share/xgreeters"
	doins ${S}/debian/deepin-greeter.desktop

	insinto "/var/lib/polkit-1/localauthority/50-local.d/"
	doins ${S}/debian/lightdm.pkla

	insinto "/etc/sysctl.d/"
	doins ${S}/debian/30-deepin-inotify-limit.conf
}
