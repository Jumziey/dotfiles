# Lines configured by zsh-newuser-install
SAVEHIST=1000
setopt appendhistory notify
unsetopt autocd beep extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jumzi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
autoload -U promptinit; promptinit
prompt spaceship

alias ls='ls --color=auto'
alias rg='rg -p'
alias less='less -r'

tsconv() {
    date -d @$1
}
lines() {
	find . -type f -print0 | wc -l --files0-from=-
}

img() {
	viewnior "$@" 
}
play() {
	mpv "$@" 
}

ascii_convert() {
	tmpdir=/tmp/image2ascii
	[ -d $tmpdir ] || mkdir tmpdir
	rm $tmpdir/temp.pbm

	echo $1
	echo $2
	convert -geometry $1 $2 $tmpdir/temp.pbm
	pbmtoascii < $tmpdir/temp.pbm
	
}

ascii_convert2() {
	tmpdir=/tmp/image2ascii
	[ -d $tmpdir ] || mkdir tmpdir
	rm $tmpdir/temp.pbm

	echo $1
	echo $2
	convert -geometry $1 $2 $tmpdir/temp.pbm
	pbmtoascii -2x4 < $tmpdir/temp.pbm
	
}

tar_compress() {
	tar -czvf $1.tar.gz $1
}

docker_activate_konftel() {
	export DOCKER_HOST="tcp://10.134.102.104:2375"
}

docker_deactivate_konftel() {
	unset DOCKER_HOST
}

recursive_replace() {
	command="find $PWD -type f -print0 | xargs -0 sed -i \"s/${1}/${2}/g\""
	echo $command
	eval $command
}

lowercase() {
	echo "${1}" | tr '[:upper:]' '[:lower:]'
}

vartype() {
    local var=$( declare -p $1 )
    local reg='^declare -n [^=]+=\"([^\"]+)\"$'
    while [[ $var =~ $reg ]]; do
            var=$( declare -p ${BASH_REMATCH[1]} )
    done

    case "${var#declare -}" in
    a*)
            echo "ARRAY"
            ;;
    A*)
            echo "HASH"
            ;;
    i*)
            echo "INT"
            ;;
    x*)
            echo "EXPORT"
            ;;
    *)
            echo "OTHER"
            ;;
    esac
}

alias printrun='docker run --device /dev/ttyACM0 -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $PWD:/root twhtanghk/docker.printrun'

alias printrunACM1='docker run --device /dev/ttyACM1 -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $PWD:/root twhtanghk/docker.printrun'

alias xclip='xclip -selection clipboard'
alias xcl='tr -d [:space:] | xclip -selection clipboard'

# Sane default
export PATH=$PATH:$HOME/bin
export PATH=$PATH:.
export TERMINAL=alacritty
export BROWSER=firefox
export PATH=$PATH:~/.local/bin

#Firefox
#For touch screen events
export MOZ_USE_XINPUT2=1

# golang
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

#sudo alias (mostly used for vim)
alias sudo='sudo -E'

#ruby/gem
export PATH=$PATH:/home/jumzi/.gem/ruby/2.6.0/bin
export PATH=$PATH:/home/jumzi/.gem/ruby/2.7.0/bin

#EDITOR
export EDITOR="nvim"


#Canboat
export PATH=$PATH:/opt/canboat/bin
