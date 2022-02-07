echo "::notice::$(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒')"
echo "::notice::https://github.com/some6508/all/archive/$(curl -s 'https://api.github.com/repos/some6508/all/commits' | grep -m 1 'sha' | sed 's/.*"sha": "//g; s/",//g').zip"
home=`pwd`
exec 2>$home/.ccaeo.log
set -x
PS4='$LINENO:	'
cd $home
ec() { echo "$(date '+%M分%S秒.%3N毫秒')	$@"; }
CURL() {
echo --------------------------------------------------
ec "- 下载文件	$1"
ec "- 连接链接	$2"
curl -s --connect-timeout 10 -o $home/$1 "$2"
local CURL=$?
[[ $CURL = 0 ]] && ec "- 下载完成	$CURL" || ec "! 下载失败	$CURL"
return $CURL
}
echo $(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒')
setsid ping -c 1 -w 1 -A -q some6508.ccaeo.com 
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
*.txt) CURL v2 "$href" ;;
*.yml) CURL c2 "$href" ;;
*.zip) CURL vc.zip "$href"
unzip -p $home/vc.zip '*txt' >v2 && ec "- 解压成功	v2" || ec "! 解压失败	v2"
unzip -p $home/vc.zip '*.yml' >c2 && ec "- 解压成功	c2" || ec "! 解压失败	c2"
rm -rf $home/vc.zip ;;
*) ec "! 链接错误	$href" ;;
esac
eval "`curl -s 'https://api.github.com/repos/zyfxz/V2Ray/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/zyfxz/V2Ray/main/|p' | sed 's|</a>|"|g'`"
CURL v3 "$href"
eval "`curl -s 'https://api.github.com/repos/zyfxz/clash/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/zyfxz/clash/main/|p' | sed 's|</a>|"|g'`"
CURL c3 "$href"
eval "`curl -s 'https://api.github.com/repos/FMYC2015/V2ray/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/FMYC2015/V2ray/main/|p' | sed 's|</a>|"|g'`"
CURL v4 "$href"
eval "`curl -s 'https://api.github.com/repos/FMYC2015/Clash/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/FMYC2015/Clash/main/|p' | sed 's|</a>|"|g'`"
CURL c4 "$href"
CURL v5 'https://raw.githubusercontent.com/ssrsub/ssr/master/V2Ray'
CURL c5 'https://raw.githubusercontent.com/ssrsub/ssr/master/Clash.yml'
CURL v6 'https://gitee.com/chenx58/clash/raw/V2R/V2R'
eval "`curl -s 'https://api.github.com/repos/bhqz/bhqz/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/bhqz/bhqz/main/|p' | sed 's|</a>|"|g; s|{.* → ||g; s|}||g'`"
case "$href" in
*.txt) CURL v7 "$href" ;;
*.yaml) CURL c6 "$href" ;;
*) ec "! 链接错误	$href" ;;
esac
CURL v8 'https://raw.githubusercontent.com/freefq/free/master/v2'
CURL v9 'https://raw.githubusercontent.com/freefq/free/master/ssr'
eval "`curl -s 'https://api.github.com/repos/w379740999/jdlj/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/w379740999/jdlj/main/|p' | sed 's|</a>|"|g'`"
CURL v10 "$href"
CURL v11 'https://raw.githubusercontent.com/Jsnzkpg/Jsnzkpg/Jsnzkpg/Jsnzkpg'
CURL v12 'https://raw.githubusercontent.com/shangou0923/gou/main/README'
eval "`curl -s 'https://api.github.com/repos/moneyfly1/sublist/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/moneyfly1/sublist/main/|p' | sed 's|</a>|"|g'`"
case "$href" in
*.yml) CURL c7 "$href" ;;
*) ec "! 链接错误	$href" ;;
esac
CURL cv1 'https://api.v1.mk/sub?target=clash&url=https://raw.githubusercontent.com/some6508/all/master/c|https://raw.githubusercontent.com/some6508/all/master/c2|https://raw.githubusercontent.com/some6508/all/master/c3|https://raw.githubusercontent.com/some6508/all/master/c4|https://raw.githubusercontent.com/some6508/all/master/c5|https://raw.githubusercontent.com/some6508/all/master/c6|https://raw.githubusercontent.com/some6508/all/master/c7|https://raw.githubusercontent.com/some6508/all/master/v|https://raw.githubusercontent.com/some6508/all/master/v2|https://raw.githubusercontent.com/some6508/all/master/v3|https://raw.githubusercontent.com/some6508/all/master/v4|https://raw.githubusercontent.com/some6508/all/master/v5|https://raw.githubusercontent.com/some6508/all/master/v6|https://raw.githubusercontent.com/some6508/all/master/v7|https://raw.githubusercontent.com/some6508/all/master/v8|https://raw.githubusercontent.com/some6508/all/master/v9|https://raw.githubusercontent.com/some6508/all/master/v10|https://raw.githubusercontent.com/some6508/all/master/v11|https://raw.githubusercontent.com/some6508/all/master/v12&config=https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Full.ini'
CURL vc1 'https://api.v1.mk/sub?target=v2ray&url=https://raw.githubusercontent.com/some6508/all/master/c|https://raw.githubusercontent.com/some6508/all/master/c2|https://raw.githubusercontent.com/some6508/all/master/c3|https://raw.githubusercontent.com/some6508/all/master/c4|https://raw.githubusercontent.com/some6508/all/master/c5|https://raw.githubusercontent.com/some6508/all/master/c6|https://raw.githubusercontent.com/some6508/all/master/c7|https://raw.githubusercontent.com/some6508/all/master/v|https://raw.githubusercontent.com/some6508/all/master/v2|https://raw.githubusercontent.com/some6508/all/master/v3|https://raw.githubusercontent.com/some6508/all/master/v4|https://raw.githubusercontent.com/some6508/all/master/v5|https://raw.githubusercontent.com/some6508/all/master/v6|https://raw.githubusercontent.com/some6508/all/master/v7|https://raw.githubusercontent.com/some6508/all/master/v8|https://raw.githubusercontent.com/some6508/all/master/v9|https://raw.githubusercontent.com/some6508/all/master/v10|https://raw.githubusercontent.com/some6508/all/master/v11|https://raw.githubusercontent.com/some6508/all/master/v12&config=https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online_Full.ini'
if grep -q '</html>' $home/cv1
then rm -rf $home/cv1 $home/vc1
else
mv -f $home/cv1 $home/cv
mv -f $home/vc1 $home/vc
fi
sed -i "/^|20/c|$(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒')|" $home/README.md
sed -i "/^20/c$(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒' -d '+1 hour')" $home/README.md
echo --------------------------------------------------
echo $(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒')
