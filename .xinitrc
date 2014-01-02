#setup monitor
monitor &

xrdb -merge "$HOME/.Xresources"
#xrdb ~/.Xdefaults 
#xset fp rehash 
setxkbmap  -layout "us,ru" -option "grp:alt_shift_toggle,grp_led:scroll"
#unclutter -grab -noevents -root &
#compton -cCb -fD 5 -r 5 -o 0.5 -l 2 -t 2 &
#xautolock -time 5 -locker "gnome-screensaver-command -l" -notify 10 -notifier "notify-send -t 5000 -i gtk-dialog-info 'Locking in 10 seconds'" &
if [ $(pgrep unclutter | wc -w) -gt 0 ]; then
	kill $(pgrep unclutter | tail -n1);
fi

# key refresh rate
xset r rate 320 35

# mouse acceleration
xset m 3/2 6

# setup DPMS
xset dpms $DPMS_STANDBY $DPMS_SUSPEND $DPMS_OFF

# disable screensaver
xset s noblank
xset s off

# neutral pointer
xsetroot -cursor_name left_ptr &

# start dropbox
dropbox start &

#setup bspwm
sxhkd -n &
happy_fs &

exec wm
