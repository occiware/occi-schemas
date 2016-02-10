#!/bin/bash -e

urlencode() {
    # urlencode <string>

    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%s' "$c" | xxd -p -c1 |
                   while read c; do printf '%%%s' "$c"; done ;;
        esac
    done
}

urldecode() {
    # urldecode <string>

    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\\x}"
}

usage() {
    basename=$(basename $0)
    echo "Usage: $basename string.."
}

if test $# -lt 1; then
    usage
    exit 1
fi

case $(basename $0) in
    encode.sh)
	urlencode $1
	;;
    decode.sh)
	urldecode $1
	;;
    *)
	usage
	exit 1
	;;
esac

exit 0
