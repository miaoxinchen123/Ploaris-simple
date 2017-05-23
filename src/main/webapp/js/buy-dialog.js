/*
 * 立即购买
 */
 function buyNow(md5, title, format, price){
	var currentTime = new Date();
	var year = (new Date(currentTime.valueOf() + 1000 * 1800)).getYear() + 1900;
	var month = (new Date(currentTime.valueOf() + 1000 * 1800)).getMonth() + 1;
	var date = (new Date(currentTime.valueOf() + 1000 * 1800)).getDate();
	var hour = (new Date(currentTime.valueOf() + 1000 * 1800)).getHours(); 
	var minute = (new Date(currentTime.valueOf() + 1000 * 1800)).getMinutes();
	
	document.getElementById("send-time").innerText = month + "月" + date + "日" + hour + "时" + minute + "分之前发至邮箱";
 	document.getElementById("order-name").innerText = title;
 	document.getElementById("order-price").innerText = "¥" + price;
 	document.getElementById("order-md5").innerText = md5;
 	document.getElementById("order-format").innerText = format;
 	
	var winWidth;
	var winHeight;
	if(window.innerWidth) {
		winWidth = window.innerWidth;
	}
	else if((document.body) && (document.body.clientWidth)) {
		winWidth = document.body.clientWidth;		
	}
	
	if(window.innerHeight) {
		winHeight = window.innerHeight;		
	}
	else if((document.body) && (document.body.clientHeight)) {
		winHeight = document.body.clientHeight;		
	}
	if(document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth) {
		winHeight = document.documentElement.clientHeight;
		winWidth = document.documentElement.clientWidth;
	}
	document.getElementById("buy-form").children[0].style.top = ((window.innerHeight - 292) / 2) + "px";
	document.getElementById("buy-form").children[0].style.left = ((winWidth - 500) / 2) + "px";
	document.getElementById("buy-form").style.display = "block";
}
 
function canelBuy() {
	document.getElementById("buy-form").style.display="none";
}


function buyWithAlipayOrWeixin(banktype) {
	if($("#receive").val().length > 100 
			|| $("#receive").val().length < 4
			|| $("#receive").val().indexOf(".") < 0 
			|| $("#receive").val().indexOf("@") < 0) {
		alert("请您填写正确的邮箱");
		return;
	}
	
	var id = Date.now();
	
	$.post("http://122.112.212.219:9000/receiveOrderInfo", {
		orderId: id,
		receive: $("#receive").val(),
		address: "",
		tel: "",
		emergency: "false",
		qq: "",
		name: "ebook",
		price: $("#order-price").html().split("¥")[1] 
	});
	
	if(banktype == "weixin" && isMobile() == true) {
		window.location.href = "http://pay.nbkyzl.com/pay.html?" +
				"channel=3" + 
				"&order_id=" + id + 
				"&money=" + $("#order-price").html().split("¥")[1] +  
				"&subject=高清原版电子书" + 
				"&return_url=http://nilescience.nbkyzl.com" +
				"&notify_url=http://nilescience.nbkyzl.com/WeixinPayNotify";
	}
	else if(banktype == "weixin" && isMobile() == false) {
		window.location.href = "http://pay.nbkyzl.com/pay.html?" +
				"channel=3" + 
				"&order_id=" + id + 
				"&money=" + $("#order-price").html().split("¥")[1] + 
				"&subject=高清原版电子书" + 
				"&return_url=http://nilescience.nbkyzl.com" +
				"&notify_url=http://nilescience.nbkyzl.com/WeixinPayNotify";
	}
	else if(banktype == "alipay" && isMobile() == true) {
		window.location.href = "http://pay.nbkyzl.com/pay.html?" +
				"channel=2" + 
				"&order_id=" + id + 
				"&money=" + $("#order-price").html().split("¥")[1] + 
				"&subject=高清原版电子书" + 
				"&return_url=http://nilescience.nbkyzl.com" +
				"&notify_url=http://nilescience.nbkyzl.com/AlipayWapNotify";
	}
	else if(banktype == "alipay" && isMobile() == false) {
		window.location.href = "http://pay.nbkyzl.com/pay.html?" +
				"channel=1" + 
				"&order_id=" + id + 
				"&money=" + $("#order-price").html().split("¥")[1] + 
				"&subject=高清原版电子书" + 
				"&return_url=http://nilescience.nbkyzl.com" +
				"&notify_url=http://nilescience.nbkyzl.com/AlipayWapNotify";
	}
	else if(isMobile() == true) {
		
	}
	else {
		
	}
}

function isMobile() {
	var browser={
		versions:function(){
			var u = navigator.userAgent, app = navigator.appVersion;   
			return {//移动终端浏览器版本信息
				trident: u.indexOf('Trident') > -1, //IE内核  
				presto: u.indexOf('Presto') > -1, //opera内核  
				webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核  
				gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核  
				mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端  
				ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端  
				android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器  
				iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器  
				iPad: u.indexOf('iPad') > -1, //是否iPad    
				webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部  
			};
		}(),  
		language:(navigator.browserLanguage || navigator.language).toLowerCase()  	
	}   

	if(browser.versions.mobile || browser.versions.ios || browser.versions.android ||   
			browser.versions.iPhone || browser.versions.iPad){  
		return true;
	}  
	else {
		return false;
	}
}