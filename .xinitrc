xbindkeys

twmnd &
blueman-applet &
nm-applet &
flameshot &

# Not a requirement, but useful especially for screen configs
LOCAL="$HOME"/.xinitrc-local
if [[ -f "$LOCAL" ]]; then
	source $HOME/.xinitrc-local 2>/dev/null
fi

# Needs to be run after screen resolution changes
# something thats often set in xinitrc-local
feh --bg-scale $HOME/.config/desktop/background.jpg &
exec i3 
