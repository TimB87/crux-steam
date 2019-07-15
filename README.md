# crux-steam

It works!

![screenshot](steam-native.png)
Only for internal use and show casing :D

# 07/15/19
"indicator ports" are polished up and added to the optional depends for `steam-native-runtime`

# 07/12/19
Icons work! They only needed `mono`, `gtk-sharp` and `libappindicator` build with sharp bindings... because that's what icons usually need? :D
This still will need a good sweeping!
Also - signatures are added!

# 05/14/19
Everything should work out of the box. Except libappindicator-gtk2-32, which fails for pygtk2-32 and pygobject-32 not being available. pygtk-32 fails for pygobject-32 not being available, which needs gobject-32 which also doesn't compile. arch doesn't have any of that crap ported it seems. https://www.archlinux.org/packages/multilib/x86_64/lib32-libappindicator-gtk2/

# To Do

*  networkmanager-32
*  udev
*  port libsdl2-32
*  libnewt uses git as a source, it's based on tb/libnewt, maybe I should revisit them
*  maybe I pulled avahi-32 by mistake?
  * it doesn't build right now, but it did build, which is most curious..
  * I am pretty sure I pulled that by mistake
  * UPDATE: I think I didn't, I have avahi on my system for KODI which forced me to fork the port of cups in opt because it doesn't compile when avahi is installed. so this should work for everybody, I fixed the problem with avahi-32 and cups-32
*  appindicator in i3bar/…? does not show
  * we are missing libappindicator-gtk2-32...
  * it works in a very hacky manner!
  * libdbusmenu-32, libindicator-32 and libappindicator-32 need another, more skilled look?
  * they should be fine now
*  does libsoup-32 need those two check lines for vala-32 and krb5-32?
*  python3-32 needs some checking, just to be sure
*  rtmpdump-32 uses git as a source
*   * either I pack it up myself and host or is it ok to use git and versioned checkout maybe?
    * since you updated your port of rtmpdump, I just should use the same source over here
*  clean up
  * not quiet sure how to put deps, findeps is no help. the big brother in case plus maybe python or whatever?
  *  cleaned up most Pkgfiles (didn't put deps yet)
  *  deps should be fine?! mostly at least
* Darkest Dungeon seems to run, but DOOM (the new one) which depends on Steam Proton (wine :D) doesn't
  * Total War: Warhammer runs (native feral port) fine as is too
  * as far as I understand, PROTON is not supposed to run from an native runtime?
  * most of the Stuff *just works* for me (tb)

# Notes

14:10 < Romster> https://wiki.archlinux.org/index.php/Steam/Troubleshooting

14:10 < Romster> cd ~/.steam/root/ubuntu12_32

14:10 < Romster> file * | grep ELF | cut -d: -f1 | LD_LIBRARY_PATH=. xargs ldd | grep 'not found' | sort | uniq

14:11 < Romster> DEBUGGER=gdb steam also works for debugging

14:13 < Romster> Ilibnm-glib.so.4 => not found

14:13 < Romster> Ilibnm-util.so.2 => not found

14:13 < Romster> Ilibudev.so.0 => not found

14:17 < Romster> be sure to strip all the binarys and foo.so and just keep the libnm-glib.so.4 libnm-util.so.2 libudev.so.0 libswithout the symlink to .so

14:29 < Romster> prtverify -m missing-deps -m file-conflict -c /usr/ports/core -c /usr/ports/opt -c /usr/ports/xorg/ -c /usr/ports/compat-32/ -c /usr/ports/contrib/ -c /usr/ports/compat-32/ .

-> I need to add my personal REPOS to that
prtverify -m missing-deps -m file-conflict -c /usr/ports/core -c /usr/ports/opt -c /usr/ports/xorg/ -c /usr/ports/compat-32/ -c /usr/ports/contrib/ -c /usr/ports/compat-32/ -c /usr/ports/tb -c /usr/ports/overlay .

And -c /usr/ports/steam ?
