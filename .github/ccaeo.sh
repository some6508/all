set -xo pipefail
export PS4='$LINENO: '

ls -A `pwd`/*

function _CURL() {
unset url
echo "Get Link: $@"
eval `curl -s "https://api.github.com/repos/$@/commits" | sed -n 's/.*"url": /url=/p' | sed -n '3p'`
eval `curl -s "${url/,}" | sed -n 's/.*"raw_url": /raw_url=/p'`
}

function CURL() {
[[ -z $raw_url ]] && return $$
echo "Download link: $raw_url"
curl -s -L "${raw_url/,}" -o $1
unset raw_url
}

_CURL 'changfengoss/pub'
if [[ "$raw_url" = *.txt, ]]
then CURL v
elif [[ "$raw_url" = *.yaml, ]]
then CURL c
fi

_CURL 'pojiezhiyuanjun/freev2'
CURL c2
