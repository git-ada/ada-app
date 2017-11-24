/** 日志服务器地址 **/
var adaLogServer = "http://45.125.219.106:8002";
var adaPageInTime = 0;
var adaSiteId;
var adaClientId;
var adaChannelId="";
var adaMouseMoveTiems = 0;
var adaMouseClickTimes=0;
var adaPageStopTimes = 0;
var adaMousescrollTiems = 0;
var adaHasPutLog=false;
var adaHasPutLogReturn=false;

/** JS页面加载后立即执行 **/
adaPageIn();
	

/** 打开页面处理 初始化  **/
function adaPageIn(){
	try{
		/** 记录进入页面时间  **/
		adaPageInTime = new Date();
		/** 获得站点ID **/
		adaSiteId = adaGetSiteId();
		
		/** 判断如果Cookie中未生成客户端ID,则生成新的客户端ID **/
		var existsClientId = (document.cookie.indexOf("adaClientId=") != -1);
		if(existsClientId){
			adaClientId = adaGetcookie("adaClientId").split("=")[1];
		}else {
			adaClientId = createUUID();
			/** 将客户端ID保存到Cookie中 **/
			document.cookie = "adaClientId="+adaClientId+";expires="+adaGetLongTimeExpires();
		}
	
		/** 判断渠道ID是否存在，如果不存在则查询渠道ID **/
		var existsChannelId = (document.cookie.indexOf("adaChannelId=") != -1);
		if(existsChannelId){
			adaChannelId = adaGetcookie("adaChannelId").split("=")[1];
			adaPutLog1();
		}else{
			adaQueryChannelId();
		}
	} catch(e){
	}
}

function createUUID(){
	try{
		var s = [];
		var hexDigits = "0123456789abcdef";
			for (var i = 0; i < 36; i++) {
				s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
			}
			s[14] = "4"; 
			s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  
			s[8] = s[13] = s[18] = s[23] = "";	 
			
		var u = s.join("");
		return u;
	} catch(e){
	}
}
/*************************************************************************************/

/** 获取站点ID **/
function adaGetSiteId(){
	try{
	    var reg = new RegExp("(^|/?|&)siteId=([^&]*)(/s|&|$)", "i");
	    if (reg.test(adajs.src))
	        return RegExp.$2; 
	    else
	        return ""; 
	} catch(e){
	}
}
/*************************************************************************************/

/** 鼠标点击次数计数 **/
document.onclick = function(){
	try{
		/** 判断如果Cookie中未生成客户端ID,则生成新的客户端ID **/
		var existsAdaMouseClickTimes = (document.cookie.indexOf("adaMouseClickTimes=") != -1);
		if(existsAdaMouseClickTimes){
			adaMouseClickTimes = adaGetcookie("adaMouseClickTimes").split("=")[1];
		}else {
			adaMouseClickTimes = 0;
		}
		adaMouseClickTimes = parseInt(adaMouseClickTimes) +1;
		document.cookie = "adaMouseClickTimes="+adaMouseClickTimes+";expires="+adaGetTodayExpires();
		
		if(adaMouseClickTimes==1 || adaMouseClickTimes == 3 || adaMouseClickTimes == 6 || adaMouseClickTimes == 11){
			adaPutLog2();
		}
	} catch(e){
	}
};

function adaGetLongTimeExpires(){
	try{
		var expires= new Date();
		expires.setFullYear(expires.getFullYear()+100, expires.getMonth(), expires.getDate());	
		return expires;
	} catch(e){
	}
}
/*************************************************************************************/
/**  页面停留累计时长  **/
setInterval("adaStopTime()","1000");
function adaStopTime(){
	try{
		/** 判断如果Cookie中未生成,则生成新的时长 **/
		var existsAdaPageStopTimes = (document.cookie.indexOf("adaPageStopTimes=") != -1);
		if(existsAdaPageStopTimes){
			lastStopTimes = adaGetcookie("adaPageStopTimes").split("=")[1];
		}else {
			lastStopTimes = 0;
		}
		adaPageStopTimes = parseInt(lastStopTimes) + 1;
		document.cookie = "adaPageStopTimes="+adaPageStopTimes+";expires="+adaGetTodayExpires();
		if(adaPageStopTimes == 5 || adaPageStopTimes == 30 || adaPageStopTimes == 120 || adaPageStopTimes == 300){
			adaPutLog3();
		}
	} catch(e){
	}
};

/*************************************************************************************/
/**  获取鼠标滚动次数 **/
var adaMousesScrollNum = 0;
window.setInterval(function (){
	adaMousesScrollNum = adaGetMousescrollNum();
	if(adaMousesScrollNum > 0){
		adaMousesScrollNum = 0;
		adaMousescroll();
	}
},1000);
function adaMousescroll(){
	try{
		/** 判断如果Cookie中未生成,则生成新的滚动次数 **/
		var existsAdaMousescrollTiems = (document.cookie.indexOf("adaMousescrollTiems=") != -1);
		if(existsAdaMousescrollTiems){
			lastMousescrollTiems = adaGetcookie("adaMousescrollTiems").split("=")[1];
		}else {
			lastMousescrollTiems = 0;
		}
		adaMousescrollTiems = parseInt(lastMousescrollTiems) + 1;
		document.cookie = "adaMousescrollTiems="+adaMousescrollTiems+";expires="+adaGetTodayExpires();
		if(adaMousescrollTiems == 1 || adaMousescrollTiems == 3 || adaMousescrollTiems == 5 || adaMousescrollTiems == 10){
			adaPutLog5();
		}
	} catch(e){
	}
}
function adaGetMousescrollNum(){
	try{
		var agent = navigator.userAgent;
		if (/.*Firefox.*/.test(agent)) {
			document.addEventListener("DOMMouseScroll", function(e) {
				e = e || window.event;
				var detail = e.detail;
				if (detail = 0) {
					adaMousesScrollNum ;
				} else {
					adaMousesScrollNum ++ ;
				}
			});
		}else {
			document.onmousewheel = function(e) {
				e = e || window.event;
				var wheelDelta = e.wheelDelta;
				if (wheelDelta = 0) {
					adaMousesScrollNum ;
				} else {
					adaMousesScrollNum ++ ;
				}
			};
		}
		return adaMousesScrollNum;
	} catch(e){
	}
}



/*************************************************************************************/
/** 获取鼠标移动次数 **/
var _AMMcount = 0;
window.setInterval(function (){
	if(_AMMcount > 0){
		_AMMcount = 0;
		adaMouseMove();
	}
},1000);
document.onmousemove=function(even){
	_AMMcount ++;
};
function adaMouseMove(){
	try{
		/** 判断如果Cookie中未生成,则生成新的移动次数 **/
		var existsadaMouseMoveNum = (document.cookie.indexOf("adaMouseMoveTiems=") != -1);
		if(existsadaMouseMoveNum){
			lastadaMouseMoveNum = adaGetcookie("adaMouseMoveTiems").split("=")[1];
		}else {
			lastadaMouseMoveNum = 0;
		}
		adaMouseMoveTiems = parseInt(lastadaMouseMoveNum) + 1;
		document.cookie = "adaMouseMoveTiems="+adaMouseMoveTiems+";expires="+adaGetTodayExpires();
		if(adaMouseMoveTiems == 1 || adaMouseMoveTiems == 3 || adaMouseMoveTiems == 5 || adaMouseMoveTiems == 10){
			adaPutLog4();
		}
	} catch(e){
	}
}

function adaGetTodayExpires (){
	try{
		var curDate = new Date();  
		//当前时间戳    
		var curTamp = curDate.getTime();  
		//当日凌晨的时间戳,减去一毫秒是为了防止后续得到的时间不会达到00:00:00的状态    
		var curWeeHours = new Date(curDate.toLocaleDateString()).getTime() - 1;  
		//当日已经过去的时间（毫秒）    
		var passedTamp = curTamp - curWeeHours;  
		//当日剩余时间    
		var leftTamp = 24 * 60 * 60 * 1000 - passedTamp;  
		var leftTime = new Date();  
		leftTime.setTime(leftTamp + curTamp);  
		var term = leftTime.toGMTString();
		return term;
	} catch(e){
	}
}
/*************************************************************************************/
/** 查询渠道ID并村粗COOKIE**/
function adaQueryChannelId() {
	try{
		var httprequest = null;
		if (window.XMLHttpRequest) {
			httprequest = new XMLHttpRequest();
		}else if (window.ActiveXObject) {
			httprequest = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (!httprequest) {
			console.log("初始化Httprequest失败");
		}
		var encodeURI = encodeURIComponent(window.location.href);
		httprequest.open("get",adaLogServer+"/q?u="+adaClientId+"&s="+adaSiteId+"&p="+encodeURI+"&t="+Date.parse(new Date()),true); 
		httprequest.onreadystatechange = function () {
			if (httprequest.readyState == 4) {
				if (httprequest.status == 200) {
				   var ret = httprequest.responseText;
				   console.log("查询渠道ID,ret->"+ret);
				   if(ret != null && ret!= "undefined" && ret != ""){
					   adaChannelId = ret;
					   document.cookie = "adaChannelId="+adaChannelId+";expires="+adaGetLongTimeExpires();
				   }
				   adaPutLog1();
				}else{
					console.log("查询渠道ID失败");
				}
			}
		};
		httprequest.send();
	} catch(e){
	}
};
function adaGetcookie(name){
	try{
		var arr= document.cookie.indexOf(name+"=");
		if( arr == -1 ){
			return null;
			arr += name.length+1;
		}else{
			var end = document.cookie.indexOf(";",arr);
			if( end == -1){
				return unescape(document.cookie.substring(arr));
			}
			return unescape(document.cookie.substring(arr,end));;
		}
	} catch(e){
	}
};

/*************************************************************************************/
/** 推送日志 **/
function adaPutLog1() {
	try{
		var httprequest = adagetHttpRequest();
		var encodeURI = encodeURIComponent(window.location.href);
		httprequest.open("get", adaLogServer + "/l1?u="+adaClientId+"&s="+adaSiteId+"&c="+adaChannelId+"&p="+encodeURI+"&t="+Date.parse(new Date()), true);
		httprequest.send();
	} catch(e){
	}
}

function adaPutLog2() {
	try{
		var httprequest = adagetHttpRequest();
		var encodeURI = encodeURIComponent(window.location.href);
		httprequest.open("get", adaLogServer + "/l2?u="+adaClientId+"&s="+adaSiteId+"&c="+adaChannelId+"&n="+adaMouseClickTimes+"&p="+encodeURI+"&t="+Date.parse(new Date()), true);
		httprequest.send();
	} catch(e){
	}
}

function adaPutLog3() {
	try{
		var httprequest = adagetHttpRequest();
		var encodeURI = encodeURIComponent(window.location.href);
		httprequest.open("get", adaLogServer + "/l3?u="+adaClientId+"&s="+adaSiteId+"&c="+adaChannelId+"&n="+adaPageStopTimes+"&p="+encodeURI+"&t="+Date.parse(new Date()), true);
		httprequest.send();
	} catch(e){
	}
}

function adaPutLog4() {
	try{
		var httprequest = adagetHttpRequest();
		var encodeURI = encodeURIComponent(window.location.href);
		httprequest.open("get", adaLogServer + "/l4?u="+adaClientId+"&s="+adaSiteId+"&c="+adaChannelId+"&n="+adaMouseMoveTiems+"&p="+encodeURI+"&t="+Date.parse(new Date()), true);
		httprequest.send();
	} catch(e){
	}
}

function adaPutLog5() {
	try{
		var httprequest = adagetHttpRequest();
		var encodeURI = encodeURIComponent(window.location.href);
		httprequest.open("get", adaLogServer + "/l5?u="+adaClientId+"&s="+adaSiteId+"&c="+adaChannelId+"&n="+adaMousescrollTiems+"&p="+encodeURI+"&t="+Date.parse(new Date()), true);
		httprequest.send();
	} catch(e){
	}
}


function adagetHttpRequest(){
	try{
		var httprequest = null;
		if (window.XMLHttpRequest) {
			httprequest = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) {
			httprequest = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (!httprequest) {
			console.log("初始化httprequest失败");
		}
		return httprequest;
	} catch(e){
	}
}