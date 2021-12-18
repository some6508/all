home=`pwd`
exec 2>$home/ccaeo.log
set -x
PS4='$LINENO: '
cd $home
CURL() {
echo "- 下载文件: $1"
echo "- 连接链接: $2"
curl -so $home/$1 "$2"
local CURL=$?
[[ $CURL = 0 ]] && echo "- 下载完成: $CURL" || echo "! 下载失败: $CURL"
}
echo $(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒')
eval "`curl -s 'https://api.github.com/repos/changfengoss/pub/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/changfengoss/pub/main/|p' | sed 's|</a>|"|g'`"
case "$href" in
*.txt) CURL v "$href" ;;
*.yaml) CURL c "$href" ;;
*) echo "! $href !" ;;
esac
eval "`curl -s 'https://api.github.com/repos/pojiezhiyuanjun/freev2/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/pojiezhiyuanjun/freev2/master/|p' | sed 's|</a>|"|g'`"
case "$href" in
*.txt) CURL v2 "$href" ;;
*.yml) CURL c2 "$href" ;;
*.zip) CURL vc.zip "$href"
unzip -p $home/vc.zip '*txt' >v2
unzip -p $home/vc.zip '*.yml' >c2
rm -rf $home/vc.zip ;;
*) echo "! $href !" ;;
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
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/bhqz/bhqz/main/|p' | sed 's|</a>|"|g'`"
case "$href" in
*.txt) CURL v7 "$href" ;;
*.yaml) CURL c6 "$href" ;;
*) echo "! $href !" ;;
esac
CURL cv 'https://sub.789.st/sub?target=clash&url=https://raw.githubusercontent.com/some6508/all/master/c|https://raw.githubusercontent.com/some6508/all/master/c2|https://raw.githubusercontent.com/some6508/all/master/c3|https://raw.githubusercontent.com/some6508/all/master/c4|https://raw.githubusercontent.com/some6508/all/master/c5|https://raw.githubusercontent.com/some6508/all/master/c6|https://raw.githubusercontent.com/some6508/all/master/v|https://raw.githubusercontent.com/some6508/all/master/v2|https://raw.githubusercontent.com/some6508/all/master/v3|https://raw.githubusercontent.com/some6508/all/master/v4|https://raw.githubusercontent.com/some6508/all/master/v5|https://raw.githubusercontent.com/some6508/all/master/v6|https://raw.githubusercontent.com/some6508/all/master/v7&insert=false&config=https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online.ini&exclude=中国&emoji=false&list=false&tfo=false&scv=false&fdn=true&sort=true&expand=true&new_name=true'
CURL vc 'https://sub.789.st/sub?target=v2ray&url=https://raw.githubusercontent.com/some6508/all/master/c|https://raw.githubusercontent.com/some6508/all/master/c2|https://raw.githubusercontent.com/some6508/all/master/c3|https://raw.githubusercontent.com/some6508/all/master/c4|https://raw.githubusercontent.com/some6508/all/master/c5|https://raw.githubusercontent.com/some6508/all/master/c6|https://raw.githubusercontent.com/some6508/all/master/v|https://raw.githubusercontent.com/some6508/all/master/v2|https://raw.githubusercontent.com/some6508/all/master/v3|https://raw.githubusercontent.com/some6508/all/master/v4|https://raw.githubusercontent.com/some6508/all/master/v5|https://raw.githubusercontent.com/some6508/all/master/v6|https://raw.githubusercontent.com/some6508/all/master/v7&insert=false&config=https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/config/ACL4SSR_Online.ini&exclude=中国&emoji=false&list=false&tfo=false&scv=false&fdn=true&sort=true&expand=true&new_name=true'
sed -i "/^|20/c|$(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒')|" $home/README.md
sed -i "/^20/c$(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒' -d '+1 hour')" $home/README.md
echo $(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒')
