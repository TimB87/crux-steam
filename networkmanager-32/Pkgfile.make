# Description: Network configuration tool
# URL:         http://www.gnome.org/projects/NetworkManager/
# Maintainer:  Alan Mizrahi, alan at mizrahi dot com dot ve
# Depends on:  intltool dbus-glib libnl nss libndp p5-xml-parser openresolv dhcpcd polkit upower
# Optional:    ppp avahi bash-completion dbus libnl jansson libteam dnsmasq

name=networkmanager-32
version=1.14.6
release=1
source=(
http://ftp.gnome.org/pub/gnome/sources/NetworkManager/${version%.*}/NetworkManager-${version}.tar.xz
)

build() {
	cd NetworkManager-$version
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	CONFIG_SHELL=/bin/bash \
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--libdir=/usr/lib32 \
		--libexecdir=/usr/lib32/NetworkManager \
		--with-udev-dir=/lib/udev \
		--with-systemdsystemunitdir=no \
		--disable-nls \
		--disable-static \
		--enable-tests=no \
		--enable-gtk-doc=no \
		--enable-gtk-doc-html=no \
		--enable-introspection=no \
		--with-suspend-resume=upower \
		--with-dhcpcd=/sbin/dhcpcd \
		--with-resolvconf=/usr/sbin/resolvconf \
		--with-iptables=/usr/sbin/iptables \
		--with-crypto=nss \
		--enable-more-warnings=no \
		--enable-modify-system \
		--with-session-tracking=consolekit \
		--with-suspend-resume=upower \
		--with-libnm-glib \
		--$(test -f /usr/include/pppd/pppd.h && echo enable || echo disable)-ppp

	make
}
