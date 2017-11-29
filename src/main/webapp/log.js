/** 日志服务器地址 **/
var adaLogServer = "http://45.125.219.106:8001";
var adaPageInTime = 0;
var adaSiteId;
var adaClientId;
var adaChannelId = "";
var adaMouseMoveTiems = 0;
var adaMouseClickTimes=0;
var adaPageStayTime = 0;
var adaMousescrollTimes = 0;
var adaFirstTime ="";

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
		var existsClientId = (document.cookie.indexOf("7kDWBXPQ=") != -1);
		if(existsClientId){
			adaClientId = adaGetcookie("7kDWBXPQ").split("=")[1];
		}else {
			adaClientId = adaCreateUUID();
			/** 将客户端ID保存到Cookie中 **/
			document.cookie = "7kDWBXPQ="+adaClientId+";expires="+adaGetLongTimeExpires();
		}
		
		if(document.cookie.indexOf("KaiEcGsT=") != -1){
			adaFirstTime = adaGetcookie("KaiEcGsT").split("=")[1];
		}
	
		/** 判断渠道ID是否存在，如果不存在则查询渠道ID **/
		var existsChannelId = (document.cookie.indexOf("tqTY092G=") != -1);
		if(existsChannelId){
			adaChannelId = adaGetcookie("tqTY092G").split("=")[1];
		}
		adaPutLog1();
	} catch(e){
	}
}

function adaCreateUUID(){
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
/** 判断传入的日期是否同一天 **/
function adaIsSameDay(date1, date2){
	try{
		if(date1!=null && date2!=null){
			if(   date1.getYear()==date2.getYear()
			   && date1.getMonth()==date2.getMonth()
			   && date1.getDate()==date2.getDate()){
				return true;
			}
		}
		return false;
	} catch(e){
	}
}

/** 获取当前用户是否老用户 **/
function adaIsOldUser(){
	try{
		/** 获取Cookie首次创建时间 **/
		var firstTime =  adaGetcookie("KaiEcGsT").split("=")[1];
		var isSameDay = adaIsSameDay(new Date(firstTime),adaPageInTime);
		
		/** 判断如果页面进入时间和首次创建时间是同一天，说明是新用户 **/
		if(isSameDay==true){
			/** 是同一天说明是新用户，**/
			return false;
		}else if (isSameDay==false){
			return true;
		}else{
			return false;
		}
	} catch(e){
	}
}
/*************************************************************************************/
/** 鼠标点击次数计数 **/
document.onclick = function(){
	try{
		/** 判断如果Cookie中未生成客户端ID,则生成新的客户端ID **/
		var existsAdaMouseClickTimes = (document.cookie.indexOf("bBd7H5Hd=") != -1);
		if(existsAdaMouseClickTimes){
			adaMouseClickTimes = adaGetcookie("bBd7H5Hd").split("=")[1];
		}else {
			adaMouseClickTimes = 0;
		}
		adaMouseClickTimes = parseInt(adaMouseClickTimes) +1;
		document.cookie = "bBd7H5Hd="+adaMouseClickTimes+";expires="+adaGetTodayExpires();
		
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
setInterval("adaStatStayTime()","1000");
function adaStatStayTime(){
	try{
		/** 判断如果Cookie中未生成,则生成新的时长 **/
		var existsAdaPageStayTime = (document.cookie.indexOf("Tcn272xJ=") != -1);
		if(existsAdaPageStayTime){
			lastStayTime = adaGetcookie("Tcn272xJ").split("=")[1];
		}else {
			lastStayTime = 0;
		}
		adaPageStayTime = parseInt(lastStayTime) + 1;
		document.cookie = "Tcn272xJ="+adaPageStayTime+";expires="+adaGetTodayExpires();
		if(adaPageStayTime == 5 || adaPageStayTime == 30 || adaPageStayTime == 120 || adaPageStayTime == 300){
			adaPutLog3();
		}
	} catch(e){
	}
};

/*************************************************************************************/
/**  获取鼠标滚动次数 **/
var adaMousesScrollNum = 0;
var adaMobileScrollNum = 0;
window.onscroll = function() {
		adaMobileScrollNum++;
	};
window.setInterval(function (){
	adaMousesScrollNum = adaGetMousescrollNum();
	if( adaIsPC() == true ){
		if(adaMousesScrollNum > 0){
			adaMousesScrollNum = 0;
			adaMousescroll();
		}
	}else{
		if(adaMobileScrollNum > 0){
			adaMobileScrollNum = 0;
			adaMousescroll();
		}
	}
},1000);

function adaMousescroll(){
	try{
		/** 判断如果Cookie中未生成,则生成新的滚动次数 **/
		var existsadaMousescrollTimes = (document.cookie.indexOf("HmrswNQk=") != -1);
		if(existsadaMousescrollTimes){
			lastMousescrollTiems = adaGetcookie("HmrswNQk").split("=")[1];
		}else {
			lastMousescrollTiems = 0;
		}
		adaMousescrollTimes = parseInt(lastMousescrollTiems) + 1;
		document.cookie = "HmrswNQk="+adaMousescrollTimes+";expires="+adaGetTodayExpires();
		if(adaMousescrollTimes == 1 || adaMousescrollTimes == 3 || adaMousescrollTimes == 5 || adaMousescrollTimes == 10){
			adaPutLog5();
		}
	} catch(e){
	}
}

/** 判断客户端是否为 PC 还是手持设备 **/
function adaIsPC() {
	try{
		var userAgentInfo = navigator.userAgent;
		var Agents = ["Android", "iPhone",
					"SymbianOS", "Windows Phone",
					"iPad", "iPod"];
		var flag = true;
		for (var v = 0; v < Agents.length; v++) {
			if (userAgentInfo.indexOf(Agents[v]) > 0) {
				flag = false;
				break;
			}
		}
		return flag;
	}catch(e){
	}
};
/** PC 端滚动次数统计 **/
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
var adaMOveTempNum = 0;
window.setInterval(function (){
	if(adaMOveTempNum > 0){
		adaMOveTempNum = 0;
		adaMouseMove();
	}
},1000);
document.onmousemove=function(even){
	adaMOveTempNum ++;
};
function adaMouseMove(){
	try{
		/** 判断如果Cookie中未生成,则生成新的移动次数 **/
		var existsadaMouseMoveNum = (document.cookie.indexOf("yRn5RWYr=") != -1);
		if(existsadaMouseMoveNum){
			lastadaMouseMoveNum = adaGetcookie("yRn5RWYr").split("=")[1];
		}else {
			lastadaMouseMoveNum = 0;
		}
		adaMouseMoveTiems = parseInt(lastadaMouseMoveNum) + 1;
		document.cookie = "yRn5RWYr="+adaMouseMoveTiems+";expires="+adaGetTodayExpires();
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
/** 获取cookie **/
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
	return "";
};

/*************************************************************************************/
function adaQueryChannelId() {
	try{
		var httprequest = null;
		if (window.XMLHttpRequest) {
			httprequest = new XMLHttpRequest();
		}else if (window.ActiveXObject) {
			httprequest = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (!httprequest) {
			//console.log("初始化Httprequest失败");
		}
		var encodeURI = encodeURIComponent(window.location.href);
		httprequest.open("get",adaLogServer+"/q?u="+adaClientId+"&s="+adaSiteId+"&p="+encodeURI+"&t="+Date.parse(new Date()),true); 
		httprequest.onreadystatechange = function () {
			if (httprequest.readyState == 4) {
				if (httprequest.status == 200) {
				   var ret = httprequest.responseText;
				   if(ret != null && ret!= "undefined" && ret != ""){
					   adaChannelId = ret;
					   document.cookie = "tqTY092G="+adaChannelId+";expires="+adaGetLongTimeExpires();
				   }
				   adaPutLog1();
				}
			}
		};
		httprequest.send();
	} catch(e){
	}
};

/**
浏览器版本**/
function adaIsBrowser(){
	try{
		//取得浏览器的userAgent字符串
		var userAgent = navigator.userAgent; 
		if (userAgent.indexOf("Opera") > -1) return "Opera"; 
		if (userAgent.indexOf("Firefox") > -1) return "Firefox"; 
		if (userAgent.indexOf("Liebao") > -1)  return "Liebao";
		if (userAgent.indexOf("360") > -1)  return "360";
		if (userAgent.indexOf("Duba") > -1)  return "Duba";
		if (userAgent.indexOf("Chrome") > -1)  return "Chrome";
		if (userAgent.indexOf("Safari") > -1) return "Safari";
		if (userAgent.indexOf("UC") > -1)  return "UC";
		if (userAgent.indexOf("QQ") > -1)  return "QQ";
		if (userAgent.indexOf("Sogou") > -1)  return "Sogou";
		if (!!window.ActiveXObject || "ActiveXObject" in window) return "IE";
		return "other";
	}catch(e){
	}
}
/**
操作系统版本**/
function adaIsOS() {
	try{
		//取得浏览器的userAgent字符串
		var sUserAgent = navigator.userAgent;
		var isWin = (navigator.platform == "Win32") ||(navigator.platform == "Win64")  || (navigator.platform == "Windows");
		var isMac = (navigator.platform == "Mac68K") || (navigator.platform == "MacPPC") || (navigator.platform == "Macintosh") || (navigator.platform == "MacIntel");
		if (isMac) return "Mac";
		var isUnix = (navigator.platform == "X11") && !isWin && !isMac;
		if (isUnix) return "Unix";
		var isLinux = (String(navigator.platform).indexOf("Linux") > -1);
		if (isLinux) return "Linux";
		if (isWin) {
			var isWin2K = sUserAgent.indexOf("Windows NT 5.0") > -1 || sUserAgent.indexOf("Windows 2000") > -1;
			if (isWin2K) return "Win2000";
			var isWinXP = sUserAgent.indexOf("Windows NT 5.1") > -1 || sUserAgent.indexOf("Windows XP") > -1;
			if (isWinXP) return "WinXP";
			var isWin2003 = sUserAgent.indexOf("Windows NT 5.2") > -1 || sUserAgent.indexOf("Windows 2003") > -1;
			if (isWin2003) return "Win2003";
			var isWinVista= sUserAgent.indexOf("Windows NT 6.0") > -1 || sUserAgent.indexOf("Windows Vista") > -1;
			if (isWinVista) return "WinVista";
			var isWin7 = sUserAgent.indexOf("Windows NT 6.1") > -1 || sUserAgent.indexOf("Windows 7") > -1; 
			if (isWin7) return "Win7";
			var isWin10 =  sUserAgent.indexOf("Windows 2008") > -1; 
			if (isWin10) return "Win8";
			var isWin10 = sUserAgent.indexOf("Windows NT 10.0") > -1 || sUserAgent.indexOf("Windows 10") > -1; 
			if (isWin10) return "Win10";
		}
		return "other";
	}catch(e){
	}
}

/** 推送日志 **/
function adaPutLog1() {
	try{
		/** 
		屏幕分辨率 **/
		var screenSize = window.screen.width+"x"+window.screen.height;
		/** 
		网页分辨率 **/
		var pageSize = document.body.offsetWidth+"x"+document.documentElement.clientHeight;
		var httprequest = adagetHttpRequest();
		var pageReferrer = encodeURIComponent(document.referrer);
		var encodeURI = encodeURIComponent(window.location.href);
		var f = "";
		if(document.cookie.indexOf("fr8itTYL=") == -1){
			f = Date.parse(adaPageInTime);
			document.cookie = "fr8itTYL="+adaPageInTime+";expires="+adaGetTodayExpires();
		}
		httprequest.open("get", adaLogServer + "/l1?u="+adaClientId+"&s="+adaSiteId+"&c="+adaChannelId+"&p="+encodeURI+"&r="+pageReferrer+
				"&o="+adaFirstTime+"&f="+f+"&os="+adaIsOS()+"&br="+adaIsBrowser()+"&ss="+screenSize+"&ps="+pageSize+"&if="+"&t="+Date.parse(new Date()), true);
		httprequest.onreadystatechange = function () {
			if (httprequest.readyState == 4) {
				if (httprequest.status == 200) {
				   var ret = httprequest.responseText;
				   if(ret != null && ret!= "undefined" && ret != "" && ret != "ok"){
						 try {
							   var jet = JSON.parse(ret);
							   if(adaChannelId == null || adaChannelId == ""){
								   if(jet.c !=null && jet.c !="undefined" && jet.c != ""){
									   adaChannelId = jet.c;
									   document.cookie = "tqTY092G="+adaChannelId+";expires="+adaGetLongTimeExpires();
								   }
							   }
							   if(adaFirstTime==null || adaFirstTime == ""){
								   if(jet.o !=null && jet.o !="undefined" && jet.o != ""){
									   adaFirstTime = jet.o;
									   document.cookie = "KaiEcGsT="+adaFirstTime+";expires="+adaGetLongTimeExpires();
								   }
							   }
						} catch (e) {
						}
				   }
				}
			}
		};
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
		httprequest.open("get", adaLogServer + "/l3?u="+adaClientId+"&s="+adaSiteId+"&c="+adaChannelId+"&n="+adaPageStayTime+"&p="+encodeURI+"&t="+Date.parse(new Date()), true);
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
		httprequest.open("get", adaLogServer + "/l5?u="+adaClientId+"&s="+adaSiteId+"&c="+adaChannelId+"&n="+adaMousescrollTimes+"&p="+encodeURI+"&t="+Date.parse(new Date()), true);
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
			//console.log("初始化httprequest失败");
		}
		return httprequest;
	} catch(e){
	}
}