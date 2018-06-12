#!/bin/bash
#
# ~/.xinitrc

# rules:
# processes/programs that run once (don't hang) run normally
# processes/programs that keep running (hang) run with & in the end to be pushed to the bg
# final process (usually window manager) gets an exec because once exec happens, xinirec terminates.
# when .xinitrc is finished, that is when X ends. It isn't when your window manager exits.
# before writing the program line here, check if it hangs. 


# check for configs:
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xrdb ~/.Xresources



# map keyboard
xmodmap -e "keycode 51 shift = grave asciitilde"
xmodmap -e "keycode 49 shift = less greater"
xmodmap -e "keycode 94 shift = backslash bar"

# map mouse



# mount C://OS



# udiskie for auto-mounting flash drives
udiskie -n &



# invoke global xsession
. /etc/X11/Xsession


# finally the hanged process
exec i3
