<?php
/**
 * @package Lanzou
 * @author iami233
 * @version 1.2.0
 * @link http://github.com/5ime/Lanzou_api
 */
header('Access-Control-Allow-Origin:*');
header('Content-type: application/json');
error_reporting(0);
$url = @$_GET['url'];
$pwd = @$_GET['pwd'];
$type = @$_GET['type'];
$error = curl($url);
if (strpos($error,'文件取消分享了') !== false) {
	$Json = array(
	"code" => 201,
	"msg" => '文件取消分享了',
);
$Json = json_encode($Json, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
echo stripslashes($Json);
return $Json;
}elseif ($url != null) {
	if ($pwd == NULL) {
		$b = 'com/';
		$c = '/';
		$id = GetBetween($url, $b, $c);
		$d = 'https://www.lanzous.com/tp/' . $id;
		$lanzouo = curl($d);
		if (strpos($lanzouo,'输入密码') !== false) {
			$Json = array(
			"code" => 202, 
			"msg" => '请输入密码',
			);
		$Json = json_encode($Json, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
		echo stripslashes($Json);
		return $Json;
		}
		preg_match_all("/<div class=\"md\">(.*?)<span class=\"mtt\">/", $lanzouo, $name);
		preg_match_all('/时间:<\\/span>(.*?)<span class=\\"mt2\\">/', $lanzouo, $time);
		preg_match_all('/发布者:<\\/span>(.*?)<span class=\\"mt2\\">/', $lanzouo, $author);
		preg_match_all('/var domianload = \'(.*?)\';/', $lanzouo, $down1);
		preg_match_all('/domianload \+ \'(.*?)\'/', $lanzouo, $down2);
		preg_match_all('/<div class=\\"md\\">(.*?)<span class=\\"mtt\\">\\((.*?)\\)<\\/span><\\/div>/', $lanzouo, $size);
		$download = getRedirect($down1[1][0] . $down2[1][0]);
		if($type == 'down'){
			header("Location:{$download}");
		}
		$Json = array(
			"code" => 200,
			"data" => array(
				"name" => $name[1][0],
				"author" => $author[1][0],
				"time" => $time[1][0],
				"size" => $size[2][0],
				"url" => $download
				)
		);
		$Json = json_encode($Json, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
		$str = "<a href=\"$download\">立即下载</a>";
//		echo stripslashes($Json);
		header("Content-Type: text/html; charset=utf-8");
		echo "<title>蓝奏云直链解析</title>";
		echo '<meta charset="utf-8">';
		echo '<meta name="baidu-site-verification" content="b9lOcChmbf">';
		echo '<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">';
		echo "<center>";
			echo "<hr></hr>";
			echo '文件：'.$name[1][0];
			echo "<hr></hr>";
			echo '作者：'.$author[1][0];
			echo "<hr></hr>";
			echo '时间：'.$time[1][0];
			echo "<hr></hr>";
			echo '大小：'.$size[2][0];
			echo "<hr></hr>";
			echo $str;
			echo "<hr></hr>";
		echo "</center>";
echo <<< dxh
<script src="https://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	(function() {var coreSocialistValues = ["富强", "民主", "文明", "和谐", "自由", "平等", "公正", "法治", "爱国", "敬业", "诚信", "友善"], index = Math.floor(Math.random() * coreSocialistValues.length);document.body.addEventListener('click', function(e) {if (e.target.tagName == 'A') {return;}var x = e.pageX, y = e.pageY, span = document.createElement('span');span.textContent = coreSocialistValues[index];index = (index + 1) % coreSocialistValues.length;span.style.cssText = ['z-index: 9999999; position: absolute; font-weight: bold; color: #00FF00; top: ', y - 20, 'px; left: ', x, 'px;'].join('');document.body.appendChild(span);animate(span);});function animate(el) {var i = 0, top = parseInt(el.style.top), id = setInterval(frame, 16.7);function frame() {if (i > 180) {clearInterval(id);el.parentNode.removeChild(el);} else {i+=2;el.style.top = top - i + 'px';el.style.opacity = (180 - i) / 180;}}}}());
</script>
dxh;
		return $Json;
	}
	$b = 'com/';
	$c = '/';
	$id = GetBetween($url, $b, $c);
	$d = 'https://www.lanzous.com/tp/' . $id;
	$lanzouo = curl($d);
	preg_match_all("/<div class=\"md\">(.*?)<span class=\"mtt\">/", $lanzouo, $name);
	preg_match_all('/时间:<\\/span>(.*?)<span class=\\"mt2\\">/', $lanzouo, $time);
	preg_match_all('/发布者:<\\/span>(.*?)<span class=\\"mt2\\">/', $lanzouo, $author);
	preg_match_all('/<div class=\\"md\\">(.*?)<span class=\\"mtt\\">\\((.*?)\\)<\\/span><\\/div>/', $lanzouo, $size);
	preg_match_all('/sign\':\'(.*?)\'/', $lanzouo, $sign);
	$post_data = array('action' => 'downprocess', 'sign' => $sign[1][0], 'p' => $pwd);
	$pwdurl = send_post('https://wwa.lanzous.com/ajaxm.php', $post_data);
	if(strpos($pwdurl,'"zt":0') !== false) {
		$Json = array(
		"code" => 202,
		"msg" => '密码不正确',
		);
	$Json = json_encode($Json, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
	echo stripslashes($Json);
	return $Json;
	}
	$obj = json_decode($pwdurl, true);
	$download = getRedirect($obj['dom'] . '/file/' . $obj['url']);
	if($type == 'down'){
		header("Location:{$download}");
	}
	$Json = array(
		"code" => 200,
		"data" => array(
			"name" => $name[1][0],
			"author" => $author[1][0],
			"time" => $time[1][0],
			"size" => $size[2][0],
			"url" => $download
		)
	);
	$Json = json_encode($Json, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
	$str = "<a href=\"$download\">立即下载</a>";
//	echo stripslashes($Json);
	header("Content-Type: text/html; charset=utf-8");
	echo "<title>蓝奏云直链解析</title>";
	echo '<meta charset="utf-8">';
	echo '<meta name="baidu-site-verification" content="b9lOcChmbf">';
	echo '<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">';
	echo "<center>";
		echo "<hr></hr>";
		echo '文件：'.$name[1][0];
		echo "<hr></hr>";
		echo '作者：'.$author[1][0];
		echo "<hr></hr>";
		echo '时间：'.$time[1][0];
		echo "<hr></hr>";
		echo '大小：'.$size[2][0];
		echo "<hr></hr>";
		echo $str;
		echo "<hr></hr>";
	echo "</center>";
echo <<< dxh
<script src="https://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	(function() {var coreSocialistValues = ["富强", "民主", "文明", "和谐", "自由", "平等", "公正", "法治", "爱国", "敬业", "诚信", "友善"], index = Math.floor(Math.random() * coreSocialistValues.length);document.body.addEventListener('click', function(e) {if (e.target.tagName == 'A') {return;}var x = e.pageX, y = e.pageY, span = document.createElement('span');span.textContent = coreSocialistValues[index];index = (index + 1) % coreSocialistValues.length;span.style.cssText = ['z-index: 9999999; position: absolute; font-weight: bold; color: #00FF00; top: ', y - 20, 'px; left: ', x, 'px;'].join('');document.body.appendChild(span);animate(span);});function animate(el) {var i = 0, top = parseInt(el.style.top), id = setInterval(frame, 16.7);function frame() {if (i > 180) {clearInterval(id);el.parentNode.removeChild(el);} else {i+=2;el.style.top = top - i + 'px';el.style.opacity = (180 - i) / 180;}}}}());
</script>
dxh;
	return $Json;

} else {
	header("Content-Type: text/html; charset=utf-8");
	echo "<title>蓝奏云直链解析</title>";
	echo '<meta charset="utf-8">';
	echo '<meta name="baidu-site-verification" content="b9lOcChmbf">';
	echo '<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">';
	echo "<hr></hr>";
	echo 'http://'.$_SERVER['SERVER_NAME'];
	echo '/ljzzyy?url=链接&pwd=密码&type=down';
	echo "<hr></hr>";
	echo <<< dxh
<script src="https://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	(function() {var coreSocialistValues = ["富强", "民主", "文明", "和谐", "自由", "平等", "公正", "法治", "爱国", "敬业", "诚信", "友善"], index = Math.floor(Math.random() * coreSocialistValues.length);document.body.addEventListener('click', function(e) {if (e.target.tagName == 'A') {return;}var x = e.pageX, y = e.pageY, span = document.createElement('span');span.textContent = coreSocialistValues[index];index = (index + 1) % coreSocialistValues.length;span.style.cssText = ['z-index: 9999999; position: absolute; font-weight: bold; color: #00FF00; top: ', y - 20, 'px; left: ', x, 'px;'].join('');document.body.appendChild(span);animate(span);});function animate(el) {var i = 0, top = parseInt(el.style.top), id = setInterval(frame, 16.7);function frame() {if (i > 180) {clearInterval(id);el.parentNode.removeChild(el);} else {i+=2;el.style.top = top - i + 'px';el.style.opacity = (180 - i) / 180;}}}}());
</script>
dxh;
}
function send_post($url, $post_data)
{
	$postdata = http_build_query($post_data);
	$options = array('http' => array(
		'method' => 'POST',
		'header' => 'Referer: https://www.lanzous.com/\\r\\n' . 'Accept-Language:zh-CN,zh;q=0.9\\r\\n',
		'content' => $postdata,
		'timeout' => 15 * 60,
	));
	$context = stream_context_create($options);
	$result = file_get_contents($url, false, $context);
	return $result;
}
function curl($url){
	$header[] = "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";
	$header[] = "Accept-Encoding: gzip, deflate, sdch, br";
	$header[] = "Accept-Language: zh-CN,zh;q=0.8";
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url); //设置传输的 url
	curl_setopt($ch, CURLOPT_HTTPHEADER, $header); //发送 http 报头
	curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25"); //设置UA
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_ENCODING, 'gzip,deflate'); // 解码压缩文件
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE); // 对认证证书来源的检查
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE); // 从证书中检查SSL加密算法是否存在
	curl_setopt($ch, CURLOPT_TIMEOUT, 5); // 设置超时限制防止死循环
	$output = curl_exec($ch);
	curl_close($ch);
	return $output;
}
function GetBetween($content, $start, $end)
{
	$r = explode($start, $content);
	if (isset($r[1])) {
		$r = explode($end, $r[1]);
		return $r[0];
	}
	return '';
}
function getRedirect($url,$ref='')
{
	$headers = array(
		'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
		'Accept-Encoding: gzip, deflate',
		'Accept-Language: zh-CN,zh;q=0.9',
		'Cache-Control: no-cache',
		'Connection: keep-alive',
		'Pragma: no-cache',
		'Upgrade-Insecure-Requests: 1',
	);
	$curl = curl_init();
	curl_setopt($curl, CURLOPT_URL, $url);
	curl_setopt($curl, CURLOPT_HTTPHEADER,$headers);
	if ($ref) {
		curl_setopt($curl, CURLOPT_REFERER, $ref);
	}
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($curl, CURLINFO_HEADER_OUT, true);
	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
	$data = curl_exec($curl);
	$url=curl_getinfo($curl);
	curl_close($curl);
	return $url["redirect_url"];
}