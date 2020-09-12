twmnd &
blueman-applet &
xrdb -merge ~/.Xresources
xbindkeys

#Not a requirement, but useful especially for screen configs
source $HOME/.xinitrc-local 2>/dev/null

exec i3 
