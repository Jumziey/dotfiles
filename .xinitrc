xrdb -merge ~/.Xresources
xbindkeys

twmnd &
blueman-applet &
nm-applet &

# Not a requirement, but useful especially for screen configs
source $HOME/.xinitrc-local 2>/dev/null

# Needs to be run after screen resolution changes
# something thats often set in xinitrc-local
feh --bg-scale $HOME/.config/desktop/background.jpg &
exec i3 
