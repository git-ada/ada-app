/** 日志服务器地址 **/
var adaLogServer = "http://45.125.219.106:8001";
var adaPageInTime = 0;
var adaSiteId;
var adaClientId;
var adaChannelId="";
var adaMouseMoveTiems = 0;
var adaMouseClickTimes=0;
var adaPageStayTime = 0;
var adaMousescrollTiems = 0;
var adaHasPutLog=false;
var adaHasPutLogReturn=false;
var adaNewOrOldValue ; 

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
	
		/** 判断渠道ID是否存在，如果不存在则查询渠道ID **/
		var existsChannelId = (document.cookie.indexOf("7kDWBXdf=") != -1);
		if(existsChannelId){
			adaChannelId = adaGetcookie("7kDWBXdf").split("=")[1];
			
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
/** 判断传入的日期是否是今天 **/
function getTimeIsToday(date1, date2){
	try{
		var num=24*60*60*1000 ;  	//一天的毫秒数
		var cha=date2.getTime()-date1.getTime(); //两个时间的毫秒差
		if(cha>0){
			if(cha>num){
				return false;
			}else if(date1.getDate()!=date2.getDate()){
				return false;
			}else {
				return true;
			}	
		}else{
			return true;
		}
	} catch(e){
	}
}
/** 获取判断新或者老用户的参数 **/
function adaNewOrOldJudge(){
	try{
		/** 判断如果Cookie中未生成,则生成新的 **/
		var existsAdaOldTime = (document.cookie.indexOf("KaiEcGsT=") != -1);
		if(existsAdaOldTime){
			var adaLastTime ;
			adaLastTime = adaGetcookie("KaiEcGsT").split("=")[1];
			var adaLastTime1 = new Date(adaLastTime);
			var adaTimeDiff = getTimeIsToday(adaLastTime1,adaPageInTime);
			if( adaTimeDiff == false ){
				adaNewOrOldValue = 1;			
			}else{
				adaNewOrOldValue = 0;
			}
		}else {
			document.cookie = "KaiEcGsT="+adaPageInTime+";expires="+adaGetLongTimeExpires();
			adaNewOrOldValue = 0;
		}
		return adaNewOrOldValue;
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
		var existsAdaMousescrollTiems = (document.cookie.indexOf("HmrswNQk=") != -1);
		if(existsAdaMousescrollTiems){
			lastMousescrollTiems = adaGetcookie("HmrswNQk").split("=")[1];
		}else {
			lastMousescrollTiems = 0;
		}
		adaMousescrollTiems = parseInt(lastMousescrollTiems) + 1;
		document.cookie = "HmrswNQk="+adaMousescrollTiems+";expires="+adaGetTodayExpires();
		if(adaMousescrollTiems == 1 || adaMousescrollTiems == 3 || adaMousescrollTiems == 5 || adaMousescrollTiems == 10){
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
};

/*************************************************************************************/
/** 推送日志 **/
function adaPutLog1() {
	try{
		var httprequest = adagetHttpRequest();
		var encodeURI = encodeURIComponent(window.location.href);
		httprequest.open("get", adaLogServer + "/l1?u="+adaClientId+"&s="+adaSiteId+"&p="+encodeURI+"&c="+adaNewOrOldJudge()+"&t="+Date.parse(new Date()), true);
		httprequest.onreadystatechange = function () {
			if (httprequest.readyState == 4) {
				if (httprequest.status == 200) {
				   var ret = httprequest.responseText;
				   //console.log("查询渠道ID,ret->"+ret);
				   if(ret != null && ret!= "undefined" && ret != "" ){
					   adaChannelId = ret;
					   document.cookie = "7kDWBXdf="+adaChannelId+";expires="+adaGetLongTimeExpires();
				   }
				}else{
					//console.log("查询渠道ID失败");
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
			//console.log("初始化httprequest失败");
		}
		return httprequest;
	} catch(e){
	}
}