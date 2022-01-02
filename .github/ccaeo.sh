home=`pwd`
exec 2>$home/.ccaeo.log
set -x
PS4='$LINENO: '
cd $home
CURL() {
echo --------------------------------------------------
echo "- 下载文件: $1"
echo "- 连接链接: $2"
curl -so $home/$1 "$2"
local CURL=$?
[[ $CURL = 0 ]] && echo "- 下载完成: $CURL" || echo "! 下载失败: $CURL"
return $CURL
}
echo $(date '+%Y年%m月%d日·周%u·%H点%M分%S秒.%3N毫秒')
eval "`curl -s 'https://api.github.com/repos/changfengoss/pub/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/changfengoss/pub/main/|p' | sed 's|</a>|"|g'`"
case "$href" in
*.txt) CURL v "$href" ;;
*.yaml) CURL c "$href" ;;
*) echo "! 链接错误: $href" ;;
esac
eval "`curl -s 'https://api.github.com/repos/pojiezhiyuanjun/freev2/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/pojiezhiyuanjun/freev2/master/|p' | sed 's|</a>|"|g'`"
case "$href" in
*.txt) CURL v2 "$href" ;;
*.yml) CURL c2 "$href" ;;
*.zip) CURL vc.zip "$href"
unzip -p $home/vc.zip '*txt' >v2 && echo "- 解压成功: v2" || echo "! 解压失败: v2"
unzip -p $home/vc.zip '*.yml' >c2 && echo "- 解压成功: c2" || echo "! 解压失败: c2"
rm -rf $home/vc.zip ;;
*) echo "! 链接错误: $href" ;;
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
*) echo "! 链接错误: $href" ;;
esac
CURL v8 'https://raw.githubusercontent.com/freefq/free/master/v2'
CURL s 'https://raw.githubusercontent.com/freefq/free/master/ssr'
eval "`curl -s 'https://api.github.com/repos/w379740999/jdlj/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/w379740999/jdlj/main/|p' | sed 's|</a>|"|g'`"
CURL v9 "$href"
eval "`curl -s 'https://api.github.com/repos/shangou0923/shangou/commits' | grep -m 1 'html_url' | sed 's/.*"html_url": /html_url=/g'`"
eval "`curl -s "${html_url//,}" | sed -n 's|^      <a href="#diff-.*">|href="https://raw.githubusercontent.com/shangou0923/shangou/main/|p' | sed 's|</a>|"|g'`"
CURL v10 "$href"
CURL cv1 'https://api.v1.mk/sub?target=clash&url=https%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fc%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fc2%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fc3%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fc4%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fc5%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fc6%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv2%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv3%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv4%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv5%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv6%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv7%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv8%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fs%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv9%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv10&insert=true&config=https%3A%2F%2Fraw.githubusercontent.com%2FMazeorz%2Fairports%2Fmaster%2FClash%2FStitch.ini&exclude=%E4%B8%AD%E5%9B%BD&emoji=false&list=false&udp=false&tfo=false&expand=true&scv=false&fdn=true&sort=true&new_name=true'
CURL vc1 'https://api.v1.mk/sub?target=v2ray&url=https%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fc%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fc2%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fc3%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fc4%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fc5%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fc6%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv2%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv3%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv4%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv5%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv6%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv7%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv8%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fs%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv9%7Chttps%3A%2F%2Fraw.githubusercontent.com%2Fsome6508%2Fall%2Fmaster%2Fv10&insert=true&config=https%3A%2F%2Fraw.githubusercontent.com%2FMazeorz%2Fairports%2Fmaster%2FClash%2FStitch.ini&exclude=%E4%B8%AD%E5%9B%BD&emoji=false&list=false&udp=false&tfo=false&expand=true&scv=false&fdn=true&sort=true&new_name=true'
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
