<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name="keywords" content="英文电子书,Nile Science,尼罗河,电子书,文献,文献检索,电子书检索,ebook,article"/>
<meta name="description" content="Nile Science -- 尼罗河拥有庞大的电子书及文献数据库，提供一站式外语电子书文献服务：高效检索，便捷购买，高速下载。">
<title>Nile Science 英文电子书文献检索平台 帮助中心</title>
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="bookmark icon" href="images/favicon.ico">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/ui/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/global.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/help.css" />

<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/account-dialog-control.js"></script>

<script>
</script>

</head>

<body>
<div id="header">
	<span id="head-username"></span><div id="welcome">欢迎到<a href="<%=request.getContextPath()%>/index.jsp"><img id="head-logo" src="./images/head-logo.png" alt="Nile Science"></a></div>
	<div id="contact-us"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2767502394&site=qq&menu=yes">QQ咨询</a></div>
	<div id="help-me"><a target="_blank" href="./help.htm">帮助中心</a></div>
	<div id="reader-download"><a target="_blank" href="./readerDownload.htm">阅读器下载</a></div>
</div>

<div id="reader-download-title">常见问题列表</div>
	
<div id="page-center">
	<h2>Nile Science 提供什么服务？</h2>
	<p>Nile Science 提供英文电子书、英文文献的付费下载服务。</p>
			
	<h2>Nile Science数据库有多少电子书</h2>
	<p>我们的数据库包括经、史、文、哲、法、理、工等等所有门类的电子书籍超过300万部</p>
	
	<h2>电子书及文献是什么格式？</h2>
	<p>电子书的格式绝大部分为".pdf"，也包含少量其他格式，如：".epub"，".mobi" 等。</p>
	
	<h2>电子书及文献如何打开？</h2>
	<p>我们提供<a href="./readerDownload.htm"> 阅读器下载 </a>，您可以根据电子书及文献的格式选择下载相应的软件。</p>
	
	<h2>如何付款？</h2>
	<p>我们支持支付宝付款和微信付款。</p>
	
	<h2>如何收货？</h2>
	<p>在您完成购买之后，我们会通过邮件发送至您填写的邮箱。</p>
	
	<h2>我已经付款，但网站仍然显示未付款怎么办？</h2>
	<p>一般在付款后，需要10分钟左右时间便可收到邮件。</p>
	<p>如果在1小时后仍然未收到邮件，请与网站客服联系</p>
		
	<h2>是否提供纸质版产品？</h2>
	<p>非常抱歉，我们暂时不提供纸质版产品。</p>
	
	<h2>是否提供发票？</h2>
	<p>是的，我们提供书籍发票，如需要发票请提前与客服联系。</p>
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

</body>
</html>