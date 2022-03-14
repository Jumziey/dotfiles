
# Setting environment variables here
# So do not have to check that i actually
# use the variables set.
# shellcheck disable=SC2034

dockerfile_run() {
	ID=$(docker build . | tee $(tty) | grep "Successfully built" | sed 's/Successfully built //g') 
	[[ -v ID ]] || return
	CMD="docker run -it $ID $1"
	eval $CMD
}

tsconv() {
    date -d "@$1"
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

	echo "$1"
	echo "$2"
	convert -geometry "$1" "$2" $tmpdir/temp.pbm
	pbmtoascii < $tmpdir/temp.pbm
	
}

ascii_convert2() {
	tmpdir=/tmp/image2ascii
	[ -d $tmpdir ] || mkdir tmpdir
	rm $tmpdir/temp.pbm

	echo "$1"
	echo "$2"
	convert -geometry "$1" "$2" $tmpdir/temp.pbm
	pbmtoascii -2x4 < $tmpdir/temp.pbm
	
}

tar_compress() {
	tar -czvf "$1".tar.gz "$1"
}

recursive_replace() {
	command="find \"$PWD\" -type f -print0 | xargs -0 sed -i \"s/${1}/${2}/g\""
	echo "$command"
	eval "$command"
}

lowercase() {
	echo "${1}" | tr '[:upper:]' '[:lower:]'
}

vartype() {
		local var
    var=$( declare -p "$1" )
    local reg='^declare -n [^=]+=\"([^\"]+)\"$'
    while [[ $var =~ $reg ]]; do
            var=$( declare -p "${BASH_REMATCH[1]}" )
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

json_escape () {
		python -c 'import json,sys;t=sys.stdin.read();print(json.dumps(t));' < $1 
}

if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

#source /nix/store/935mbdml86s9zg6k1yna26c9d5gaxqbi-system-path/share/zsh/site-functions/prompt_spaceship_setup
