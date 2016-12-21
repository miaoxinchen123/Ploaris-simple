/*
 * 立即购买
 */
 function buyNow(title, price){
		var currentTime = new Date();
		var year = (new Date(currentTime.valueOf() + 1000 * 1800)).getYear() + 1900;
		var month = (new Date(currentTime.valueOf() + 1000 * 1800)).getMonth() + 1;
		var date = (new Date(currentTime.valueOf() + 1000 * 1800)).getDate();
		var hour = (new Date(currentTime.valueOf() + 1000 * 1800)).getHours(); 
		var minute = (new Date(currentTime.valueOf() + 1000 * 1800)).getMinutes();
		
		document.getElementById("send-time").innerText = month + "月" + date + "日" + hour + "时" + minute + "分之前发至邮箱";
	 	document.getElementById("order-name").innerText = title;
	 	document.getElementById("order-price").innerText = "¥ " + price;
		
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


function buyWithAlipayOrWeixin(type) {
	if($("#receive").val().length > 100 
			|| $("#receive").val().length < 4
			|| $("#receive").val().indexOf(".") < 0 
			|| $("#receive").val().indexOf("@") < 0) {
		alert("请您填写正确的邮箱");
		return;
	}
	
	var id = Date.now();
	
	if(type == "weixin") {
		FUQIANLAPC.init({
			isCashierDesk: false,
			appId: '97rpOtHVU1LjJEoy6Pbp0w',
			clientIp: '127.0.0.1',
			orderId: id, //订单号，
			merchId: 'm1609280024',
			channel: 'wx_pay_pub_scan',
			amount: document.getElementById("order-price").innerText.split("¥ ")[1],
			subject: 'NileScienceEbook',
			notifyUrl: 'http://www.nbkyzl.com/listen.html'	//妙妙你修改这里，然后后台监听就行。这个url随便你修改
		});
	}
	else {
		FUQIANLAPC.init({
			isCashierDesk: false,
			appId: '97rpOtHVU1LjJEoy6Pbp0w',
			clientIp: '127.0.0.1',
			orderId: id, //订单号，
			merchId: 'm1609280024',
			channel: 'ali_direct_pay_pc',
			amount: document.getElementById("order-price").innerText.split("¥ ")[1],
			subject: 'NileScienceEbook',
			notifyUrl: 'http://www.nbkyzl.com/listen.html'	//妙妙你修改这里，然后后台监听就行。这个url随便你修改
		});
	}
}