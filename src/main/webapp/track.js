;(function(x){
	var startTime = new Date();
	//var statdomain = 'http://stat.abc456xx.info:8080';
	var statdomain = 'http://192.250.196.186:8001';
	var lmgp='',cx=-1,cy=-1,mx=-1,my=-1,config_x=[],config_y=[];
	var startTop=-1,startY=-1,startX=-1,EndX=-1,EndY=-1;
	if (typeof yr_track_2hits == "undefined" || !yr_track_2hits) {
		var yr_track_2hits = {
			setMouseClick:function(ev, srcElement) {
				var aaaadclicknum = this.getCookie("aaaadclicknum");
				aaaadclicknum = aaaadclicknum || 0;
				if(aaaadclicknum>12) return false;
				if (!this.getCookie("aaaadclick")) {
					this.dolog(2);
					var _cdate = new Date();
					_cdate.setTime(_cdate.getTime()+3*1000);
					this.setCookie("aaaadclick", 1, _cdate);
					_cdate.setTime(_cdate.getTime()+2*3600*1000);
					aaaadclicknum++;
					this.setCookie("aaaadclicknum", aaaadclicknum, _cdate);
				}
			},
			dolog:function(type){
				if(!lmgp) return;
				var iv = this.getIV();
				var url = statdomain+"/track?type="+type+"&lmgp="+lmgp+"&iv="+iv+"&cx="+cx+"&cy="+cy + "&mx="+mx+"&my="+my+this.getClientInfo();
				new Image().src = url;
			},
			getMousePos:function (event) {
				var e = event || window.event;
				var scrollX = document.documentElement.scrollLeft || document.body.scrollLeft;
				var scrollY = document.documentElement.scrollTop || document.body.scrollTop;
				var x = e.pageX || e.clientX + scrollX;
				var y = e.pageY || e.clientY + scrollY;
				return {'x': x, 'y': y};
			},
			setMouseMove:function(e) {
				var e = e || window.event;
				config_x.push(parseInt(e.clientX)),
				config_y.push(parseInt(e.clientY)),
				config_x = config_x.filter(function (arr, index) {
					return (config_x.length - index)<=50;
				}),
				config_y = config_y.filter(function (arr, index) {
					return (config_y.length - index)<=50;
				});
				mx = config_x.join(','),my = config_y.join(',');
				var mousepos = this.getMousePos(e);
				cx = mousepos.x,cy = mousepos.y;
			},
			touchSatrtFunc:function (evt) {
				try {
					var touch = evt.touches[0];
					var x = Math.ceil(touch.pageX);
					var y = Math.ceil(touch.pageY);
					startTop = Math.ceil(document.body.scrollTop);
					startY = y;
					startX = x;
					EndX = x;
					EndY = y;

				} catch (e) {

				}
			},
			touchMoveFunc:function (evt) {
				try {
					var touch = evt.touches[0];
					var x = Math.ceil(touch.pageX);
					var y = Math.ceil(touch.pageY);
					EndX = x;
					EndY = y;
				} catch (e) {

				}
			},
			touchEndFunc:function (evt) {
				try {
					mx = -1 == mx ? EndX : mx + ',' + EndX;
					my = -1 == my ? (startY - startTop) : my + ',' + (startY - startTop);
					cx = startX;
					cy = startY - startTop;
				} catch (e) {
					// console.log('touchEndFunc' + e.message);
				}
			},
			getIV:function(){
				var iv = this.getCookie('U52SG62HRERWAHV');
				if(!iv) {
					var _cdate = new Date();
					iv = Math.random().toString(36).substr(2,10);
					_cdate.setTime(_cdate.getTime()+86400*1000);
					var _ndate = new Date(_cdate.getFullYear(), _cdate.getMonth(), _cdate.getDate(), 0, 0, 0);
					this.setCookie('U52SG62HRERWAHV',iv,_ndate);
				}
				return iv;
			},
			getClientInfo:function(){var _zvn=0,_zm=-1,l=-1,_zk=-1,_zj=-1,_zg=-1,_za=-1,_zy=-1,_zp=-1,_zr=-1;function _zz_(i){i=i||window.event;this.target=i.target||i.srcElement;}
			function _zv_(){if(_za==-1){_za=_zu_();}
				_zy=_zu_()-_za;}
			function _zu_(){return new Date().getTime();}
			function _Zya_(b){var Z={};if(b in Z)return Z[b];return Z[b]=navigator.userAgent.toLowerCase().indexOf(b)!=-1;}
			function _ZFv_(){if(navigator.plugins&&navigator.mimeTypes.length){var b=navigator.plugins["Shockwave Flash"];if(b&&b.description)return b.description.replace(/([a-zA-Z]|\s)+/,"").replace(/(\s)+r/,".");}else if(_Zya_("msie")&&!window.opera){var c=null;try{c=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");}catch(e){var a=0;try{c=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");a=6;c.AllowScriptAccess="always";}catch(e){if(a==6)return a.toString();}
				try{c=new ActiveXObject("ShockwaveFlash.ShockwaveFlash");}catch(e){}}
				if(c!=null){var a=c.GetVariable("$version").split(" ")[1];return a.replace(/,/g,".");}}
				return"0";}
			function _Zref_(){var r;try{r=window.top.document.referrer;}catch(e){r=document.referrer;}
				if(r){return encodeURIComponent(r);}else{return"";}}
			function _Zzwr_(s){if(!s)return"";str=s.replace(/[\u4E00-\u9FA5]/gi,"x");return str;}
			function _ZSiteurl_(){var s;try{s=window.top.document.location.href;}catch(e){s=document.location.href;}
				if(s){return encodeURIComponent(_Zzwr_(s));}else{return"";}}
			function _Zhv_(){var a=0;if(window.top.location==document.location&&document.body){var j=document.body.scrollHeight,v=document.body.clientHeight;if(v&&j){a=Math.round(j);}}
				return a;}
			function _Zsc_(){var s=window.screen;return s.width+"x"+s.height;}
			function _Zos_(){var re=/(Windows NT \d\.\d)/gi;return re.exec(navigator.userAgent)==null?navigator.platform:RegExp.$1;}
			function _Zlang_(){return navigator.browserLanguage==undefined?navigator.language:navigator.browserLanguage;}
			function _Zenjc_(){return(navigator.javaEnabled?"1":"2")+(navigator.cookieEnabled?"1":"2");}
			function _Zaddsnew_(){var w=window,d=document;var s="&u_fv="+_ZFv_()+"&u_url="+_Zref_()+"&r_url="+_ZSiteurl_()+"&u_sw="+w.screen.width+"&u_sh="+w.screen.height+"&u_scd="+w.screen.colorDepth;try{s+="&os="+encodeURIComponent(_Zos_())+"&lang="+encodeURIComponent(_Zlang_())+"&enjc="+_Zenjc_();}catch(e){}
				try{if(d.body){s=s+"&u_bw="+d.body.offsetWidth+"&u_bh="+d.body.offsetHeight+"&iv="+rich.getIV();t=new Date();t=-t.getTimezoneOffset();s=s+"&u_utz="+t/60;s=s+"&plat="+navigator.platform;}}catch(e){}
				return s;}
			try{var _adds_=_Zaddsnew_();}catch(e){var _adds_="";}
			return _adds_;},
			getCookie : function(n){var sRE = '(?:; )?'+n+'=([^;]*);?';var oRE = new RegExp(sRE);if(oRE.test(document.cookie)){return decodeURIComponent(RegExp['$1']);}return '';},
			setCookie : function(n,v,e){document.cookie=n+'='+escape(v)+';expires='+e.toGMTString()+';path=/';},
			getLocationArgs:function() {
				var args = new Object();
				var query = location.search.substring(1);
				var pairs = query.split("&");
				for (var i = 0; i < pairs.length; i++) {
					var pos = pairs[i].indexOf("=");
					if (pos != -1) {
						var argName = pairs[i].substring(0, pos);
						var value = pairs[i].substring(pos + 1);
						if (args[argName] == null) {
							args[argName] = new Array();
						}
						args[argName].push(unescape(value));
					}
				}
				return args;
			},
			getReferrer:function(){
				var r;try{r=window.top.document.referrer;}catch(e){r=document.referrer;}
				if(r){return encodeURIComponent(r);}else{return"";}
			},
			getParent:function(e, tagname) {
				if (e.tagName == tagname) {
					return e;
				}
				for (var i = 0; i < 3; i++) {
					if (e.tagName == "BODY" || e.tagName == "HTML") {
						return false;
					}
					e = e.parentElement || e.parentNode;
					if (e.tagName == tagname) {
						return e;
					}
				}
				return false;
			},
			addEvent:function(doc, ele, ev, func) {
				var tags = doc.getElementsByTagName(ele);
				for (var i = 0; i < tags.length; i++) {
					try {
						var tag = tags[i];
						var run = 0;
						if (!run) {
							var oev = this.getOEV(tag, ev, func);
							try {
								eval("tag." + ev + ' = new Function("' + func + '" + oev);');
							} catch (e) {}
							run = 1;
						}
					} catch (e) {}
				}
			},
			getOEV:function(tag, ev, func) {
				var _tmp = tag.getAttribute(ev) + "";
				if (_tmp == "null") {
					_tmp = "";
				}
				if (_tmp.indexOf("function ") > -1) {
					var _start = _tmp.indexOf("{") + 1;
					var _end = _tmp.lastIndexOf("}");
					_tmp = _tmp.substring(_start, _end);
				}
				return _tmp;
			},
			write3count:function() {
				var startTime = new Date();
				var qq360 = startTime.getTime();
			}	
		};
	}

	var arr = yr_track_2hits.getLocationArgs(),lmgp=typeof arr['lmgp']!='undefined' ? arr['lmgp'][0] : '';
	yr_track_2hits.start = function() {
		yr_track_2hits.dolog(1);
		yr_track_2hits.addEvent(document, "body", "onmousedown", "yr_track.setMouseClick();");
		yr_track_2hits.addEvent(document, "body", "onmousemove", "yr_track.setMouseMove();");
		try {
			document.createEvent("TouchEvent");
			document.addEventListener('touchstart', yr_track.touchSatrtFunc, false);
			document.addEventListener('touchmove', yr_track.touchMoveFunc, false);
			document.addEventListener('touchend', yr_track.touchEndFunc, false);
		} catch (e) {
		}
		if (window.history && window.history.pushState){
			window.onpopstate = function () {
				//window.history.pushState('forward', null, '#');
				//window.history.forward(1);
				//alert("不可回退1");
				yr_track.dolog(3);
			};
		}
		window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
		window.history.forward(1);
	}();
	window['yr_track'] = yr_track_2hits;
})();
if (!Array.prototype.filter) {
	Array.prototype.filter = function(fun) {
		"use strict";
		if (this === void 0 || this === null) throw new TypeError();
		var t = Object(this);
		var len = t.length >>> 0;
		if (typeof fun !== "function") throw new TypeError();
		var res = [];
		var thisArg = arguments.length >= 2 ? arguments[1] :void 0;
		for (var i = 0; i < len; i++) {
			if (i in t) {
				var val = t[i];
				if (fun.call(thisArg, val, i, t)) res.push(val);
			}
		}
		return res;
	};
}