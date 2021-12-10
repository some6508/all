home=`pwd`
exec 2>$home/log/ccaeo.log
set -x
PS4='$LINENO: '
echo $(date '+%Y年%m月%d日·%H点%M分%S秒.%N毫秒')
eval "`curl -sL 'https://api.github.com/repos/changfengoss/pub/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -sL "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://github.com/changfengoss/pub/raw/main/|p' | sed 's|</a>|"|g'`"
case "$href" in
*.txt) curl -sLo $home/v "$href";;
*.yaml) curl -sLo $home/c "$href";;
*) echo "$href";;
esac
eval "`curl -sL 'https://api.github.com/repos/pojiezhiyuanjun/freev2/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -sL "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://github.com/pojiezhiyuanjun/freev2/raw/master/|p' | sed 's|</a>|"|g'`"
case "$href" in
*.yml) curl -sLo $home/c2 "$href";;
*.txt) curl -sLo $home/v4 "$href";;
*.zip) curl -sLo $home/2.zip "$href"
unzip -p $home/2.zip '*txt' >$home/v4
unzip -p $home/2.zip '*.yml' >$home/c2
rm -rf $home/2.zip
;;
*) echo "$href";;
esac
eval "`curl -sL 'https://api.github.com/repos/FMYC2015/V2ray/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -sL "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://github.com/FMYC2015/V2ray/raw/main/|p' | sed 's|</a>|"|g'`"
curl -sLo $home/v2 "$href"
eval "`curl -sL 'https://api.github.com/repos/FMYC2015/Clash/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -sL "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://github.com/FMYC2015/Clash/raw/main/|p' | sed 's|</a>|"|g'`"
curl -sLo $home/c3 "$href"
curl -sLo $home/v3 'https://gitee.com/chenx58/clash/raw/V2R/V2R'
sed -i "/^|20/c|$(date '+%Y年%m月%d日·%H点%M分%S秒')|" $home/README.md
sed -i "/^20/c$(date '+%Y年%m月%d日·%H点%M分%S秒' -d '+1 hour')" $home/README.md
