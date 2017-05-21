<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<html>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name="keywords" content="adobe reader, calibre, digital editions, ireader, 电子书，阅读器，下载"/>
<meta name="description" content="电子书阅读器大全，支持pdf, djvu, epub, mobi, aws 等几十种电子书格式。可运行在电脑端和手机端。带来流畅阅读体验。">
<title>阅读器下载 电子书文献</title>
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="bookmark icon" href="images/favicon.ico">

<link rel="stylesheet" type="text/css" href="./css/global.css" />
<link rel="stylesheet" type="text/css" href="./css/index.css" />
<link rel="stylesheet" type="text/css" href="./css/reader.css" />
</head>

<body>
<div id="header">
	<span id="head-username"></span><div id="welcome">欢迎到<a href="<%=request.getContextPath()%>/index.jsp"><img id="head-logo" src="./images/head-logo.png" alt="Nile Science"></a></div>
	<div id="contact-us"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=3063791500&site=qq&menu=yes">QQ咨询</a></div>
	<div id="help-me"><a target="_blank" href="./help.htm">帮助中心</a></div>
	<div id="reader-download"><a target="_blank" href="./readerDownload.htm">阅读器下载</a></div>
</div>

<div id="reader-download-title">请选择适合您的阅读器<span onclick="window.open('./help.htm')">我该如何选择 ?</span></div>

<div class="reader-item-wrapper">
	<div class="reader-item">
		<div class="reader-icon" id="pdf-icon"></div>
		<div class="reader-info">
			<div class="reader-title">Adobe Reader</div>
			<div class="reader-abstract">最常用的pdf阅读器</div>
			<div class="reader-format">我们的电子书大多数都是pdf格式</div>
			<div class="reader-download-div">
				<a href="./readers/arpc.exe" download>
					<div class="windows-version-download-button">
						<div class="windows-version-download-button-left"></div>
						<div class="windows-version-download-button-right">下载 windows 版</div>
					</div>
				</a>
				<a href="./readers/armac.exe" download>
					<div class="mac-version-download-button">
						<div class="mac-version-download-button-left"></div>
						<div class="mac-version-download-button-right">下载 mac 版</div>
					</div>
				</a>
			</div>
		</div>
	</div>
</div>

<div class="reader-item-wrapper">
	<div class="reader-item">
		<div class="reader-icon" id="calibre-icon"></div>
		<div class="reader-info">
			<div class="reader-title">Calibre (V_2.74)</div>
			<div class="reader-abstract">完整的电子书管理、格式转换、同步等功能</div>
			<div class="reader-format">可用于阅读pdf, mobi, epub, azw等格式的电子书</div>
			<div class="reader-download-div">
				<a href="./readers/calpc.exe" download>
					<div class="windows-version-download-button">
						<div class="windows-version-download-button-left"></div>
						<div class="windows-version-download-button-right">下载 windows 版</div>
					</div>
				</a>
				<a href="./readers/calmac.exe" download>
					<div class="mac-version-download-button">
						<div class="mac-version-download-button-left"></div>
						<div class="mac-version-download-button-right">下载 mac 版</div>
					</div>
				</a>
			</div>
		</div>
	</div>
</div>

<div class="reader-item-wrapper">
	<div class="reader-item">
		<div class="reader-icon" id="digital-editions-icon"></div>
		<div class="reader-info">
			<div class="reader-title">Digital Editions (V_2.0)</div>
			<div class="reader-abstract">常用的轻量级电子书阅读器</div>
			<div class="reader-format">可用于阅读 epub, pdf等格式的电子书</div>
			<div class="reader-download-div">
				<a href="./readers/ae2pc.exe" download>
					<div class="windows-version-download-button">
						<div class="windows-version-download-button-left"></div>
						<div class="windows-version-download-button-right">下载 windows 版</div>
					</div>
				</a>
				<a href="./readers/ae2mac.exe" download>
					<div class="mac-version-download-button">
						<div class="mac-version-download-button-left"></div>
						<div class="mac-version-download-button-right">下载 mac 版</div>
					</div>
				</a>
			</div>
		</div>
	</div>
</div>

<div class="reader-item-wrapper">
	<div class="reader-item">
		<div class="reader-icon" id="ireader-icon"></div>
		<div class="reader-info">
			<div class="reader-title">iReader (V_6.0)</div>
			<div class="reader-abstract">手机端最常用的电子书阅读器</div>
			<div class="reader-format">可用于阅读 多种格式的电子书</div>
			<div class="reader-download-div">
				<a href="http://www.zhangyue.com/products/iReader" target="_blank">
					<div class="windows-version-download-button">
						<div class="android-version-download-button-left"></div>
						<div class="android-version-download-button-right">下载 Android 版</div>
					</div>
				</a>
				<a href="http://www.zhangyue.com/products/iReader" target="_blank">
					<div class="mac-version-download-button">
						<div class="mac-version-download-button-left"></div>
						<div class="mac-version-download-button-right">下载 iOS 版</div>
					</div>
				</a>
			</div>
		</div>
	</div>
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
				<div class="footer-navigator-menu" id="footer-contact-us-search"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=3063791500&site=qq&menu=yes">QQ售前客服</a></div>
				<div class="footer-navigator-menu" id="footer-contact-us-resend"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=3063791500&site=qq&menu=yes">QQ售后客服</a></div>
				<div class="footer-navigator-menu" id="footer-contact-us-suggestion"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=3063791500&site=qq&menu=yes">意见反馈</a></div>
			</div>
			<a href="./index.jsp"><div id="footer-image"></div></a>
		</div>
	</div>
</div>

</body>
</html>