
home=`pwd`
function a() {
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
}
eval "`curl -sL 'https://github.com/changfengoss/pub/commits' | grep -m 1 'v2rayse comment file' | sed 's|.*href="|href="https://github.com|g; s|">.*|"|g'`"
eval "`curl -sL "$href" | grep -m 1 'data/' | sed 's|.*">|href="https://github.com/changfengoss/pub/raw/main/|g; s|</a>|"|g'`"
case "$href" in
*.txt) curl -sLo $home/v "$href";;
*.yaml) curl -sLo $home/c "$href";;
*) echo "$href";;
esac
eval "`curl -sL 'https://github.com/pojiezhiyuanjun/freev2/commits' | grep -m 1 'Add files via upload' | sed 's|.*href="|href="https://github.com|g; s|">.*|"|g'`"
eval "`curl -sL "$href" | grep -m 1 '.yml' | sed 's|.*">|href="https://github.com/pojiezhiyuanjun/freev2/raw/master/|g; s|</a>|"|g'`"
case "$href" in
*.yml) curl -sLo $home/c2 "$href";;
*) echo "$href";;
esac
sed -i "/^|20/c|$(date '+%Y-%m-%d %H:%M:%S.%N')|" $home/README.md
