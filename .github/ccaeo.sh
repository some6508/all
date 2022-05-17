echo "::notice::$(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒')"
echo "::notice::https://github.com/some6508/all/archive/$(curl -s 'https://api.github.com/repos/some6508/all/commits' | grep -m 1 'sha' | sed 's/.*"sha": "//g; s/",//g').zip"
home=`pwd`
exec 2>$home/.ccaeo.log
set -x
PS4='$LINENO:	'
cd $home
rm -rf $home/c* $home/v* $home/url
ec() { echo "$(date '+%M分%S秒.%3N毫秒')	$@"; }
CURL() {
curl -s -I --connect-timeout 10 "$2" | egrep -q '^HTTP.*200' || return 1
if [[ $1 = v ]]; then
	((v++))
	n=$1$v
elif [[ $1 = c ]]; then
	((c++))
	n=$1$c
else
	x=$1
fi
echo --------------------------------------------------
ec "- 下载文件	$n"
ec "- 连接链接	$2"
curl -s --connect-timeout 10 -o "$home/${x:-$n}" "$2"
CURL=$?
[[ $CURL != 0 ]] && ec "! 下载失败	$CURL" && return $CURL
ec "- 下载完成"
[[ -z $x ]] && echo -n "https://raw.githubusercontent.com/some6508/all/master/$n|" >>$home/url
return $?
}
AAA() {
curl -s 'https://github.com/some6508/all/actions' | sed -n '/<span class="color-fg-muted">$/,/<\/span>/p' | sed 's/.*">//g; s/<\/a>//g' | while read i; do
[[ -z $i ]] && continue
if [[ $i = *"</span>" ]]; then
	break
else
	echo -n "$i	"
fi
done
}
echo $(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒')
setsid curl -sI 'some6508.ccaeo.com'
eval "`curl -s 'https://api.github.com/repos/changfengoss/pub/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/changfengoss/pub/main/|p' | sed 's|</a>|"|g'`"
case "$href" in
*.txt) CURL v "$href" ;;
*.yaml) CURL c "$href" ;;
*) ec "! 链接错误	$href" ;;
esac
eval "`curl -s 'https://api.github.com/repos/pojiezhiyuanjun/freev2/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/pojiezhiyuanjun/freev2/master/|p' | sed 's|</a>|"|g'`"
case "$href" in
*.txt) CURL v "$href" ;;
*.yml) CURL c "$href" ;;
#*.zip) CURL vc.zip "$href"
#unzip -p $home/vc.zip '*txt' >v2 && ec "- 解压成功	v2" || ec "! 解压失败	v2"
#unzip -p $home/vc.zip '*.yml' >c2 && ec "- 解压成功	c2" || ec "! 解压失败	c2"
#rm -rf $home/vc.zip ;;
*) ec "! 链接错误	$href" ;;
esac
eval "`curl -s 'https://api.github.com/repos/zyfxz/V2Ray/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/zyfxz/V2Ray/main/|p' | sed 's|</a>|"|g'`"
CURL v "$href"
eval "`curl -s 'https://api.github.com/repos/zyfxz/clash/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/zyfxz/clash/main/|p' | sed 's|</a>|"|g'`"
CURL c "$href"
eval "`curl -s 'https://api.github.com/repos/FMYC2015/V2ray/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/FMYC2015/V2ray/main/|p' | sed 's|</a>|"|g'`"
CURL v "$href"
eval "`curl -s 'https://api.github.com/repos/FMYC2015/Clash/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/FMYC2015/Clash/main/|p' | sed 's|</a>|"|g'`"
CURL c "$href"
CURL v 'https://raw.githubusercontent.com/ssrsub/ssr/master/V2Ray'
CURL c 'https://raw.githubusercontent.com/ssrsub/ssr/master/Clash.yml'
eval "`curl -s 'https://api.github.com/repos/bhqz/bhqz/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/bhqz/bhqz/main/|p' | sed 's|</a>|"|g; s|{.* → ||g; s|}||g'`"
case "$href" in
*.txt) CURL v "$href" ;;
*.yaml) CURL c "$href" ;;
*.yml) CURL c "$href" ;;
*) ec "! 链接错误	$href" ;;
esac
CURL v 'https://raw.githubusercontent.com/freefq/free/master/v2'
CURL v 'https://raw.githubusercontent.com/freefq/free/master/ssr'
CURL v 'https://raw.githubusercontent.com/Jsnzkpg/Jsnzkpg/Jsnzkpg/Jsnzkpg'
eval "`curl -s 'https://api.github.com/repos/moneyfly1/sublist/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/moneyfly1/sublist/main/|p' | sed 's|</a>|"|g'`"
case "$href" in
*.yml) CURL c "$href" ;;
*/ss) CURL v "$href" ;;
*) ec "! 链接错误	$href" ;;
esac
a="`cat $home/url`"
CURL tmp_clash "https://sub.feng666.tk/sub?target=clash&url=$a&insert=false&config=https://raw.githubusercontent.com/some6508/all/master/fengguo-sjgz.ini&emoji=false&list=false&udp=false&tfo=false&expand=true&scv=false&fdn=false&sort=false"
CURL tmp_v2ray "https://sub.feng666.tk/sub?target=v2ray&url=$a&insert=false&config=https://raw.githubusercontent.com/some6508/all/master/fengguo-sjgz.ini&emoji=false&list=false&udp=false&tfo=false&expand=true&scv=false&fdn=false&sort=false"
CURL tmp_surfboard "https://sub.feng666.tk/sub?target=surfboard&url=$a&insert=false&config=https://raw.githubusercontent.com/some6508/all/master/fengguo-sjgz.ini&emoji=false&list=false&udp=false&tfo=false&expand=true&scv=false&fdn=false&sort=false"
if ! grep -q '</html>' $home/tmp_clash
then 
mv -f $home/tmp_clash $home/clash
mv -f $home/tmp_v2ray $home/v2ray
mv -f $home/tmp_surfboard $home/surfboard
fi
AAA="`AAA`"
sed -i "/^> /c> $AAA" $home/README.md
sed -i "/^|20/c|$(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒')|" $home/README.md
sed -i "/^20/c$(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒' -d '+1 hour')" $home/README.md
echo --------------------------------------------------
echo $(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒')
