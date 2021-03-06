<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta name="renderer" content="webkit" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name="keywords" content="英文电子书,Nile Science,电子书,文献,文献检索,电子书检索,ebook,article"/>
<meta name="description" content="Nile Science -- 拥有庞大的电子书及文献数据库，提供一站式外语电子书文献服务：高效检索，便捷购买，高速下载。">
<title>Nile Science 全球最大英文电子书文献检索平台</title>
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="bookmark icon" href="images/favicon.ico">

<link rel="stylesheet" type="text/css" href="./css/global.css" />
<link rel="stylesheet" type="text/css" href="./css/index.css" />
<link rel="stylesheet" type="text/css" href="./css/list.css" />
<link rel="stylesheet" type="text/css" href="./css/detail.css" />
<link rel="stylesheet" type="text/css" href="./css/buy-form.css" />

<script src="./js/jquery-1.12.4.js"></script>
<script src="./js/buy-dialog.js"></script>
<script src="./js/pcjssdk.3.0.js"></script>
<script src="./js/search-box-focus-control.js"></script>

<script>
	$(function () {
		$("#search-button-index").on("click", function() {
			var searchText = $("#searchInput").val();
			if(searchText.length != 0 &&  searchText != "More than 3 million books are available") {
				$("#f_ation").submit();
			}
		});
		
		$("#search-button-index_2").on("click", function() {
			var searchText_2 = $("#searchInput_2").val();
			if(searchText_2.length != 0 &&  searchText_2 != "More than 3 million books are available") {
				$("#searchOption").val($("#searchOption_2").val());
				$("#searchInput").val($("#searchInput_2").val());
				$("#f_ation").submit();
			}
		});
	});
</script>

</head>

<body>
<div style="position: fixed;z-index: 99999;">
	<div id="buy-form" title="填写信息" style="font-size:15px; position: fixed;z-index: 999999; display:none;">
		<div style="position: fixed; top: 0px;left: 0px;width: 500px;height: 350px;overflow:hidden; border:solid 1px rgb(229,229,229); border-radius:8px; background:white;" >
			<div id="dialog-sub-title"">填写订单信息</div>
			<div class="buy-form-wrapper-div">
				<div class="buy-form-left">收货人邮箱</div>
				<input type="text" id="receive" value="" class="buy-form-input" />
			</div>
			<div class="buy-form-wrapper-div">
				<div class="buy-form-left">电子书名称</div>
				<div type="text" id="order-name"></div>
			</div>
			<div class="buy-form-wrapper-div">
				<div class="buy-form-left">发货时间</div>
				<div type="text" id="send-time"></div>
			</div>
			<div class="buy-form-wrapper-div" style="border-bottom:double #BBB;">
				<div class="buy-form-left">价格</div>
				<div type="text" id="order-price"></div>
				<span id="price-comment"></span>
			</div>	
			
			<div id="aliPayButton" class="order-button" onclick="buyWithAlipayOrWeixin('alipay')">支付宝支付</div>
			<div id="weixinButton" class="order-button" onclick="buyWithAlipayOrWeixin('weixin')">微信支付</div>
			<div id="cancel" class="order-button" onclick="canelBuy()">取 消</div>
			<div id="order-md5" style="display:none;"></div>
			<div id="order-format" style="display:none;"></div>
		</div>
	</div>
</div>

<div style="position: fixed;z-index: 99999;">
	<div style="position: fixed; top: 25%;right: 0px;width: 167px;height: 290px;overflow:hidden;background-image:url('./images/cebian.png');" >
		<div onclick="window.open('http://wpa.qq.com/msgrd?v=3&uin=2767502394&site=qq&menu=yes');" style="width: 128px; height: 40px; float: right; margin: 88px 12px 0px 15px; cursor: pointer;"></div>		
		<div onclick="window.open('http://wpa.qq.com/msgrd?v=3&uin=3226966921&site=qq&menu=yes');" style="width: 128px; height: 40px; float: right; margin: 15px 12px 0px 15px; cursor: pointer;"></div>
	</div>
</div>

<div id="header">
	<span id="head-username"></span><div id="welcome">欢迎到<a href="<%=request.getContextPath()%>/index.jsp"><img id="head-logo" src="./images/head-logo.png" alt="Nile Science"></a></div>
	<div id="contact-us"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2767502394&site=qq&menu=yes">QQ咨询</a></div>
	<div id="help-me"><a target="_blank" href="./help.htm">帮助中心</a></div>
	<div id="reader-download"><a target="_blank" href="./readerDownload.htm">阅读器下载</a></div>
</div>

<div id="search-header">
	<a href="<%=request.getContextPath()%>/gotoIndex.htm"><img id="search-header-logo" src="<%=request.getContextPath()%>/images/logo-small-on-list-page.png" alt="Nile Science"></img></a>
	<div class="search-box">
		<form id="f_ation" name="f_ation" action="indexSearch.htm" method="post">
			<select class="search-option" id="searchOption" name="searchOption">
			    <option value="title">电子书标题</option>
				<option value="authors">电子书作者</option>
				<option value="isbn">ISBN 号码</option>
			</select>
			<input type="text" id="searchInput" name="searchInput" class="search-input" value="More than 3 million books are available" style="height:33px;"/>
			<div class="search-button" id="search-button-index">搜索</div>
		</form>
	</div>
</div>

<div class="book-item-detail">
	<div id="readable" style="display:none;">${book.readable}</div>
	<div id="exist" style="display:none;">${book.exist}</div>
	<div id="available" style="display:none;">${book.available}</div>
	<div class="book-file-detail">
		<div class="book-cover" style="background-image:url(${book.coverUrl});"></div>
		
		<div class="info-detail-other-div">
			<span class="info-detail-left">电子书格式</span>
			<img src="./images/pdf_icon.jpg" alt="" width="15" height="15">
			<span class="info-detail-right">${book.extension}</span>
			<a target="_blank" href="./readerDownload.htm"><span class="reader-downloader"> (阅读器下载)</span></a>
		</div>
		<div class="info-detail-other-div"><span class="info-detail-left">电子书大小</span><span class="info-detail-right">${book.size}MB</span></div>
	</div>
	
	<div class="book-info-detail">
		<div class="info-detail-title" id="bookTitle">${book.title}</div>
		<div class="info-detail-other-div"><span class="info-detail-left">作者</span><span class="info-detail-right">${book.authors}</span></div>
		<div class="info-detail-other-div"><span class="info-detail-left">出版时间</span><span class="info-detail-right">${book.year}年</span></div>
		<div class="info-detail-other-div"><span class="info-detail-left">出版社</span><span class="info-detail-right">${book.publisher}</span></div>
		<div class="info-detail-other-div"><span class="info-detail-left">语言</span><span class="info-detail-right">${book.language}</span></div>
		<div class="info-detail-other-div"><span class="info-detail-left">页数</span><span class="info-detail-right">${book.pages.equals("unKnown") ? "请联系客服确认具体页数" : book.pages}</span></div>
		<div class="info-detail-other-div"><span class="info-detail-left">系列</span><span class="info-detail-right">${book.series}</span></div>
		<div class="info-detail-other-div"><span class="info-detail-left">周期</span><span class="info-detail-right">${book.publisher}</span></div>
		<div class="info-detail-other-div"><span class="info-detail-left">版次</span><span class="info-detail-right">${book.edition}</span></div>
		<div class="info-detail-other-div"><span class="info-detail-left">ISBN</span><div class="info-detail-right" style="text-overflow:ellipsis;overflow:hidden;white-space: nowrap;width:600px;">${book.isbn}</div></div>
		
		<div class="price-div">
			<div class="price-div-left">
				<div class="origin-price-div"><span class="info-detail-left">价格</span><span class="info-detail-right" style="text-decoration:line-through">¥ ${book.price}</span></div>
				<div class="lower-price-div">
					<span class="info-detail-left" style="font-weight:700">促销价</span><span class="info-detail-right" style="font-size:20px;color:rgb(128,15,37);">¥ ${book.realPrice}</span> (该书可立即下载)
				</div>
			</div>
		</div>
		<div class="buy-div">
			<div id="detail-buy-button" class="buy-now-button" onclick="buyNow('${book.md5}', document.getElementById('bookTitle').innerText, '${book.extension}', '${book.realPrice}')">立即购买</div>
			<div id="pay-problem" onclick="window.open('http://wpa.qq.com/msgrd?v=3&uin=2767502394&site=qq&menu=yes')">支付遇到问题 联系QQ客服?</div>
		</div>
	</div>
</div>

<div style="width:1000px; margin:0px auto;">
	<a id="pre-reader-file" href=""><div id="reader-1" style="cursor:pointer; text-align: center;font-size: 24px;font-weight: 100;font-family: 'Microsoft Yahei', '微软雅黑';margin: 20px 0px;">您的浏览器不支持在线试读，点击此处下载<span style="color:#C40;">PDF文件</span>进行试读</div></a>
	
	<div id="reader-2" style="text-align: center;font-size: 24px;font-weight: 100;font-family: 'Microsoft Yahei', '微软雅黑';margin: 20px 0px;">试读文件（提供该书的随机几页进行试读）</div>
	<div id="pre-reader-wrapper" style="width:800px;height:900px; margin:0px auto; ">
		<iframe id="pre-reader" src="" style="width:800px; height:900px;"></iframe>
	</div>
</div>

<div style="width:100%;border-top: solid 1px rgb(220,220,220);">
	<div style="width:1000px; margin:0px auto; border-top: solid 1px rgb(220,220,220);">
		<img src="./images/detail-5.png"/>
	</div>
</div>
<div id="center-logo" style="margin-top: 0px; background-position:center;"></div>

<div id="page-center">
	<div class="search-box">
		<form id="f_ation_2" name="f_ation_2">
			<select class="search-option" id="searchOption_2" name="searchOption_2">
			    <option value="title">电子书标题</option>
				<option value="authors">电子书作者</option>
				<option value="isbn">ISBN 号码</option>
			</select>
			<input type="text" id="searchInput_2" name="searchInput_2" class="search-input" value="More than 3 million books are available"/>
			<div class="search-button" id="search-button-index_2">搜索</div>
		</form>
	</div>
</div>

<div style="width:1000px; margin:0px auto;">
	<img src="./images/detail-4.png"/>
	<img src="./images/detail-3.png"/>
	<img src="./images/detail-1.png"/>
	<img src="./images/detail-2.png"/>
</div>

<div id="footer">
	<div id="footer-wrapper">
		<div style="width:900px; margin-left:auto; margin-right:auto;">
			<div class="footer-navigator-wrapper">
				<div class="footer-navigator-head" id="footer-contact-us"><span>阅读器下载</span></div>
				<div class="footer-navigator-menu"><a target="_blank" href="./readerDownload.htm">Adobe Reader</a></div>
				<div class="footer-navigator-menu"><a target="_blank" href="./readerDownload.htm">Calibre</a></div>
				<div class="footer-navigator-menu"><a target="_blank" href="./readerDownload.htm">Digital Editions</a></div>
				<div class="footer-navigator-menu"><a target="_blank" href="./readerDownload.htm">iReader</a></div>
			</div>
			<div class="footer-navigator-wrapper">
				<div class="footer-navigator-head" id="footer-contact-us"><span>帮助中心</span></div>
				<div class="footer-navigator-menu"><a target="_blank" href="./help.htm">支付问题</a></div>
				<div class="footer-navigator-menu"><a target="_blank" href="./help.htm">电子书文件问题</a></div>
				<div class="footer-navigator-menu"><a target="_blank" href="./help.htm">其他问题</a></div>
			</div>
			<div class="footer-navigator-wrapper">
				<div class="footer-navigator-head" id="footer-contact-us"><span>联系我们</span></div>
				<div class="footer-navigator-menu" id="footer-contact-us-search"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2767502394&site=qq&menu=yes">QQ售前客服</a></div>
				<div class="footer-navigator-menu" id="footer-contact-us-resend"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2767502394&site=qq&menu=yes">QQ售后客服</a></div>
				<div class="footer-navigator-menu" id="footer-contact-us-suggestion"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2767502394&site=qq&menu=yes">意见反馈</a></div>
			</div>
			<a href="./index.jsp"><div id="footer-image"></div></a>
		</div>
	</div>
</div>
<script>
if(document.getElementById("available").innerHTML != "true") {
	document.getElementById("detail-buy-button").style.color = "#AAA";
	document.getElementById("detail-buy-button").style.backgroundColor = "#DDD";
	document.getElementById("detail-buy-button").onclick = function tst(){ 
		alert('该书暂时缺货，请联系客服。'); 
	}
}

if(document.getElementById("readable").innerHTML != "true") {
	document.getElementById("reader-1").style.display = "none";
	document.getElementById("reader-2").style.display = "none";
	document.getElementById("pre-reader-wrapper").style.display = "none";
}
else {
	var md5 = window.location.search.split("MD5=")[1].split("&")[0];
	//var md5 = "0a0cd63f4934786e120ee525c90cac3f";
	var fileUrl = "abstractions/" + md5.substr(0, 2) + "/" + md5 + ".pdf";
	if (!!window.ActiveXObject || "ActiveXObject" in window) {
		document.getElementById("reader-1").style.display = "block";
		document.getElementById("reader-2").style.display = "none";
		document.getElementById("pre-reader-wrapper").style.display = "none";
		document.getElementById("pre-reader-file").setAttribute("href", fileUrl);
	}
	else {
		document.getElementById("reader-1").style.display = "none";
		document.getElementById("reader-2").style.display = "block";
		document.getElementById("pre-reader-wrapper").style.display = "block";
		document.getElementById("pre-reader").setAttribute("src", fileUrl);
	}	
}

if(isMobile() == true) {
	document.getElementById("weixinButton").style.visibility="hidden";
}
else {
	document.getElementById("weixinButton").style.visibility="visible";
}
</script>
</body>
</html>