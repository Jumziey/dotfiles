twmnd &
blueman-applet &
xrdb -merge ~/.Xresources
picom -b --unredir-if-possible --backend xr_glx_hybrid --vsync --use-damage --glx-no-stencil
xrandr --output eDP-1 --mode 1920x1080
xbindkeys
exec i3 
