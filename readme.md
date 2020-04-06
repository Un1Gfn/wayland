See also [xorg](https://github.com/Un1Gfn/xorg)

---

* [Wayland](https://wayland.freedesktop.org/)
  * [Archwiki](https://wiki.archlinux.org/index.php/Wayland)
* [Sway](https://swaywm.org/)
  * [wiki](https://github.com/swaywm/sway/wiki) [<sup>O</sup>](https://github.com/swaywm/sway/wiki/Running-programs-natively-under-wayland) [<sup>O</sup>](https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland)
  * [Archwiki](https://wiki.archlinux.org/index.php/Sway)
* [redshift-wayland-git](https://aur.archlinux.org/packages/redshift-wayland-git)
* [Chromium Ozone](https://wiki.automotivelinux.org/_media/agl-distro/agl_chromium_preso.pdf)


/home/darren/.bashrc
```bash
# https://wiki.gnome.org/Initiatives/Wayland/GTK+
# Breaks Electron apps
# Breaks Chromium
# export GDK_BACKEND=wayland

# https://wayland.freedesktop.org/efl.html
export ECORE_EVAS_ENGINE=wayland_egl
export ELM_DISPLAY=wl
export ELM_ACCEL=gl

# https://wiki.archlinux.org/index.php/Wayland
export QT_QPA_PLATFORM=wayland-egl
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland

# https://github.com/swaywm/sway/wiki#disabling-client-side-qt-decorations
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"

# https://github.com/helionmelion/sway-fcitx-workaround
# https://wiki.archlinux.org/index.php/Sway#Keymap
# /home/darren/.config/sway/config.d/00-input.conf
# export XKB_DEFAULT_LAYOUT=jp
# export XKB_DEFAULT_VARIANT=kana86
# export XKB_DEFAULT_MODEL=jp106
# export XKB_DEFAULT_OPTIONS=grp:rctrl_toggle
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```
