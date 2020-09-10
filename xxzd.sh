
set -x
cd ${0%/*}
echo "正在下载云端数据"
/data/adb/curl "http://www.iyuji.cn/iyuji/s/dk92UVdhTnZubGpraG9NL3JJNzZsdz09/1586673855501728" |sed -n 's#.*dxh【</p><p>##p' |sed 's#】dxh.*##; s#</p><p>#\n#g; s#<br/>##g; s#\&nbsp;# #g; s#\&amp;#\&#g; s#\&quot;#\"#g; s/\&lt;/</g; s/\&gt;/>/g' &> ./云端下载.sh
if [ -f ./云端下载.sh ]; then
	echo "下载完成"
else
	echo "下载失败"
fi
