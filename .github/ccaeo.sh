
home=`pwd`
ls -A $home/*
function _CURL() {
unset url
echo "获取链接: $@"
eval `curl -sL "https://api.github.com/repos/$@/commits" | sed -n 's/.*"url": /url=/p' | sed -n '3p'`
eval `curl -sL "${url/,}" | sed -n 's/.*"raw_url": /raw_url=/p'`
}
function CURL() {
[[ -z $raw_url ]] && return $$
echo "下载文件: $raw_url"
curl -sLo $home/$1 "${raw_url/,}"
unset raw_url
}
_CURL 'changfengoss/pub'
if [[ "$raw_url" = *.txt* ]]
then CURL v
elif [[ "$raw_url" = *.y*ml* ]]
then CURL c
else echo "获取失败: $raw_url"
fi
_CURL 'pojiezhiyuanjun/freev2'
if [[ "$raw_url" = *.y*ml* ]]
then CURL c2
else echo "获取失败: $raw_url"
fi
sed -i "/^|20/c|$(date '+%Y-%m-%d %H:%M:%S.%N')|" $home/README.md
