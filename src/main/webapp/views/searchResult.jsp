<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<html>
<head>
<meta charset="UTF-8">
<title>Nile Science 全球最大英文电子书文献检索平台</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<link rel="bookmark icon" href="<%=request.getContextPath()%>/images/favicon.ico">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/global.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/list.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/buy-form.css" />

<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/js/buy-dialog.js"></script>
<script src="<%=request.getContextPath()%>/js/pcjssdk.3.0.js"></script>
<script src="<%=request.getContextPath()%>/js/search-box-focus-control.js"></script>

<script>
	$(document).ready(function(){
		for(var i=0;i<document.getElementById('searchOption').options.length;i++){ 
			if(document.getElementById('searchOption').options[i].value==='${searchOption}'){ 
				document.getElementById('searchOption').options[i].selected=true; 
			} 
		} 
	});

	$(function () {
			$("#search-button-index").on("click", function() {
			var searchText = $("#searchInput").val();
			if(searchText.length != 0 &&  searchText != "More than 3 million books are available") {
				$("#f_ation").submit();
			}
		});
	});
	/*
	 * 获取详情js
	 */
	 function bookDetail(MD5){
		 var url="<%=request.getContextPath()%>/bookDetail.htm?MD5="+MD5; 
		 window.open(url, "_blank");
	 }

	/*
	 * 分页查询js
	 */
	function pageQuery(pageSize){
		$("#pageNow").val(pageSize);
		$("#f_page").submit();
	}
	
	 /*
	 * 添加购物车
	 */
	 function addCart(md5,title,authors,price,size,covelUrl){
		 
		 var orderData={"tradeType":"addCart","md5": md5,"title":title,"authors":authors,"price": Number(price),"size":Number(size),"coverUrl":covelUrl};
		 $.ajax({  
	        type:"POST",  
	        dataType: 'text',  
	        contentType:"application/json",             
	        data:JSON.stringify(orderData),  
	        url:"user/addCart.htm",  
	        error:function(data){  
	            alert("出错了！！:"+data);  
	        },  
	        success:function(data){
	        	var result = eval(data);
	        	//修改购物车上数量
	        	if(result == "203"){
	        		dialogLogin.dialog("open");
	        		$("#email-login").val("");
	        	  	$("#password-register").val("");
	        	  	$("#password-register2").val("");
	        	}else if(result == "successAdd"){
	        		alert("成功添加")
		        	var cartCount = parseInt($("#cart-amount").text())+1;
		        	$("#cart-amount").text(cartCount)
	        	}else{
	        		alert(result);
	        	}
	        }
        });   
	 }
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
		</div>
	</div>
</div>

<div style="position: fixed;z-index: 99999;">
	<a href="#top"><div style="position: fixed; top: 85%;right: 45px;width: 48px;height: 48px;overflow:hidden;background-image:url('./images/gotop.png');"></div></a>
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
		<input type="text" id="searchInput" name="searchInput" class="search-input" value="${searchInput}" style="height:35px;"/>
		<div class="search-button" id="search-button-index">搜索</div>
		</form>
	</div>
</div>

<div id="result-overview">
	<div id="fh" class="n_l">
		<span style="padding-left:152px;">以下呈现的是“${searchInput}”的精选结果</span>
	</div>
</div>
<c:choose>  
   <c:when test="${page.totalCount > 0}">  
    <c:forEach var="pojo" varStatus="s" items="${products}">
	<div class="book-item">
	<a href="javascript:void(0)" onclick="bookDetail('${pojo.md5}')"><div class="book-cover-small" style="background-image:url(${pojo.coverUrl});"></div></a>
	<div class="book-info-simple">
		<div class="info-simple-title"><a href="javascript:void(0)" onclick="bookDetail('${pojo.md5}')">${pojo.title}</a></div>
		<div class="info-simple-other-div"><span class="info-simple-left">作者</span><span class="info-simple-right">${pojo.authors}</span></div>
		<div class="info-simple-other-div"><span class="info-simple-left">出版时间</span><span class="info-simple-right">${pojo.year}年</span></div>
		<div class="info-simple-other-div">
			<span class="info-simple-left">电子书格式</span>
			<img src="<%=request.getContextPath()%>/images/pdf_icon.jpg" alt="" class="file-format-icon"/>
			<span class="info-simple-right">${pojo.extension}</span>
		</div>
		<div class="price-div">
			<div class="price-div-left">
				<div class="origin-price-div"><span class="info-simple-left">价格</span><span class="info-simple-right" style="text-decoration:line-through">¥ ${pojo.price}</span></div>
				<div class="lower-price-div">
					<span class="info-simple-left" style="font-weight:700">促销价</span><span class="info-simple-right" style="font-size:20px;color:rgb(128,15,37);">¥ ${pojo.realPrice}</span> (该书可立即下载)
				</div>
			</div>
			<div class="price-div-right">
				<div class="buy-now-button" onclick="buyNow('${pojo.md5}', '${pojo.srcTitle}', '${pojo.realPrice}')">立即购买</div>
				<div class="view-detail-button" onclick="bookDetail('${pojo.md5}')">查看详情</div>
			</div>
		</div>
	</div>
	</div>
	</c:forEach>
	<div id="result-overview" style="margin-top:20px">
		<!-- 分页功能 start -->
		<div align="center">
		<form id="f_page" name="f_page" action="indexSearch.htm" method="post">
			<input type="hidden" name="searchOption" value="${searchOption}"/>
			<input type="hidden" name=searchInput value="${searchInput}"/>
			<input type="hidden" name="pageNow" id="pageNow"/>
			<font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
				${page.pageNow} 页</font> <a href="javascript:void(0)" onclick="pageQuery(1)">首页</a>
			<c:choose>
				<c:when test="${page.pageNow - 1 > 0}">
					<a href="javascript:void(0)" onclick="pageQuery(${page.pageNow - 1})">上一页</a>
				</c:when>
				<c:when test="${page.pageNow - 1 <= 0}">
					<a href="javascript:void(0)" onclick="pageQuery(1)">上一页</a>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${page.totalPageCount==0}">
					<a href="javascript:void(0)" onclick="pageQuery(${page.pageNow})">下一页</a>
				</c:when>
				<c:when test="${page.pageNow + 1 < page.totalPageCount}">
					<a href="javascript:void(0)" onclick="pageQuery(${page.pageNow + 1})">下一页</a>
				</c:when>
				<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
					<a href="javascript:void(0)" onclick="pageQuery(${page.totalPageCount})">下一页</a>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${page.totalPageCount==0}">
					<a href="javascript:void(0)" onclick="pageQuery(${page.pageNow})">尾页</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0)" onclick="pageQuery(${page.totalPageCount})">尾页</a>
				</c:otherwise>
			</c:choose>
		</form>
		</div>		
	</div>
</c:when>  
<c:otherwise>
	<div class="book-item">
		对不起，没有找到任何电子书。<br/><br/>
		小技巧：（1）减少搜索的词；（2）去掉逗号、冒号等特殊字符；（3）<a style="color:#C40000; text-decoration:underline;" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2767502394&site=qq&menu=yes">骚扰QQ客服</a>帮您搜索。
	</div>
</c:otherwise>  
</c:choose>  
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
if(isMobile() == true) {
	document.getElementById("weixinButton").style.visibility="hidden";
}
else {
	document.getElementById("weixinButton").style.visibility="visible";
}
</script>
</body>
</html>