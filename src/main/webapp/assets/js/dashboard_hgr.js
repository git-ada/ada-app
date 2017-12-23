var domainId = "";//域名ID
var stClick = false;
var cClick = false;
var sClick = false;
var mClick = false;
var timestamp = "";//时间戳
var ajaxTime = 2000;//异步刷新时间
var t;//setTimeout返回的值
var oTable;
var table;
var sessionData = "";//每一次更新的数据放在session中


//渲染table
var initTable1 = function () {
     table = $('#scrolltable');
     oTable = table.dataTable({
   
  
        paging: false,
        scrollY:        document.documentElement.clientHeight-295,
        "ordering": false,
        scrollX:        true,
        "info": false,
        stateSave:      true,
        "searching": false,
        fixedColumns:   {
            leftColumns: 2
        }
   
 
    });
}
/**--------------预加载-------------------- **/
	jQuery(document).ready(function() {
		onLeavePage(function (){//离开页面时的回调方法
			clearTimeout(t);
			isRefresh = "false";
		});
		if(search==null || search==""){//修改搜索框样式
    		jQuery("#searchImg").attr("class","icon-magnifier");
    		jQuery("#searchImg").css("cursor","auto");
    	}else{
    		jQuery("#searchImg").attr("class","icon-close");
    		jQuery("#searchImg").css("cursor","pointer");
    		jQuery("#searchImg").attr("onclick","clearSearch()");
    	}
		if(isRefresh=="true"){//修改暂停按钮样式
			jQuery("#pauseOrplay i").removeClass("icon-control-play");
   		 	jQuery("#pauseOrplay i").addClass("icon-control-pause");
		}else{
			jQuery("#pauseOrplay i").removeClass("icon-control-pause");
   		 	jQuery("#pauseOrplay i").addClass("icon-control-play");
		}
		var beginTime = parseInt(Date.parse(new Date()));
		firstAppend();
		initTable1();
		
		var endTime = parseInt(Date.parse(new Date()));
		console.log("渲染table消耗时间endTime---------->"+(endTime-beginTime)+"毫秒");
		
		if(isRetrun == "true"){
			console.log("是返回的");
			//如果是返回  从session中获取数据
			var json = JSON.parse(sessionStorage.getItem("json"));
			loadTbody(json,1);
		}else{
			console.log("不是返回的");
			var json = eval('(' + tbodydata + ')');
			loadTbody(json,1);
		}
	     jQuery("#pauseOrplay").click(function(){
	    	 if(jQuery("#pauseOrplay i").attr("class")=="icon-control-pause"){
	    		 jQuery("#pauseOrplay i").removeClass("icon-control-pause");
	    		 jQuery("#pauseOrplay i").addClass("icon-control-play");
	    		 clearTimeout(t);
	    		 isRefresh = "false";
	    	 }else if(jQuery("#pauseOrplay i").attr("class")=="icon-control-play"){
	    		 jQuery("#pauseOrplay i").removeClass("icon-control-play");
	    		 jQuery("#pauseOrplay i").addClass("icon-control-pause");
				 ajaxRefreshPage();
				 isRefresh = "true";
				 
	    	 }
	     });
	    
	    jQuery("#fullscreenOractual").click(function(){
	    	 if(jQuery("#fullscreenOractual i").attr("class")=="icon-size-fullscreen"){
	    		 
	    		 jQuery(".dataTables_scrollBody").css("height",document.documentElement.clientHeight-100);
	    		 jQuery(".DTFC_ScrollWrapper").css("height",document.documentElement.clientHeight-60);
	    		 
	    		 jQuery(".DTFC_LeftBodyWrapper").css("height",document.documentElement.clientHeight-118);
	    		 jQuery(".DTFC_LeftBodyLiner").css("height",document.documentElement.clientHeight-118);
	    		 
	    		 //jQuery(".dataTables_scrollHeadInner").css("width","4000px");
	    		 //jQuery(".dataTables_scrollHeadInner table").css("width","100%");
	    		 
	    		 jQuery("#fullscreenOractual i").removeClass("icon-size-fullscreen");
	    		 jQuery("#fullscreenOractual i").addClass("icon-size-actual");
	    		 
	    		   
	    	 }else if(jQuery("#fullscreenOractual i").attr("class")=="icon-size-actual"){
	    		 jQuery(".dataTables_scrollBody").css("height",document.documentElement.clientHeight-295);
	    		 jQuery(".DTFC_ScrollWrapper").css("height",document.documentElement.clientHeight-240);
	    		
	    		 jQuery(".DTFC_LeftBodyWrapper").css("height",document.documentElement.clientHeight-295);
	    		 jQuery(".DTFC_LeftBodyLiner").css("height",document.documentElement.clientHeight-295);
	    		 
	    		 jQuery("#fullscreenOractual i").removeClass("icon-size-actual");
	    		 jQuery("#fullscreenOractual i").addClass("icon-size-fullscreen");
	    		 
	    	 }
	     });  
	    //给搜索框添加 键盘按键的离开事件
	    jQuery("#search").keyup(function (){
	    	isRefresh = "false";
	    	clearTimeout(t);
	    	App.startPageLoading({animate: !0});//开启 加载 动画
	    	search = jQuery(this).val();
	    	if(search==null || search==""){
	    		jQuery("#searchImg").attr("class","icon-magnifier");
	    		jQuery("#searchImg").css("cursor","auto");
	    	}else{
	    		jQuery("#searchImg").attr("class","icon-close");
	    		jQuery("#searchImg").css("cursor","pointer");
	    		jQuery("#searchImg").attr("onclick","clearSearch()");
	    	}
	    	ajaxRefreshPage();
	    	isRefresh = "true";
	    	jQuery("#pauseOrplay i").removeClass("icon-control-play");
   		 	jQuery("#pauseOrplay i").addClass("icon-control-pause");
	    });
	    
	    if(isRefresh=="true"){
	      //第一次异步刷新
	   	  t = window.setTimeout("ajaxRefreshPage('"+dataType+"')",ajaxTime); 
	    }
	    
	   console.log("预加载完成-----》");
	});

	 
	 
	
	  
	 function ajaxRefreshPage(){
		 timestamp = Date.parse(new Date());
		 jQuery.ajax({
			 	type:"post",
				url : webPath+"/ajaxRefreshPage.do?dataType="+dataType+"&domainId="+domainId+"&firstTd="+search+"&top="+ipTop+"&timestamp="+timestamp,
				success : function(data) {
					
					if (data!=null) {
						var json = eval('(' + data + ')');
						loadTbody(json,2);
					
					}
					clearTimeout(t);
					/** browsingHistory[browsingHistory.length-1].indexOf("/dashboard.jhtm")>=0 && **/
					if(isRefresh=="true"){
						ajaxTime=2000;
						t = window.setTimeout("ajaxRefreshPage('"+dataType+"','"+domainId+"')",ajaxTime); 
					}
					App.stopPageLoading();//关闭 加载动画
				},
				error: function (data) {
					App.stopPageLoading();//关闭 加载动画
					clearTimeout(t);
					ajaxTime=ajaxTime*2;
					t = window.setTimeout("ajaxRefreshPage('"+dataType+"','"+domainId+"')",ajaxTime); 
				}
			});
	 }
/** js渲染tbody  browsingHistory[browsingHistory.length-1].indexOf("/dashboard.jhtm")>=0 &&  **/
function loadTbody(json,num){
	 if(dataType==json.dataType ){
		// domainId = json.domainId;//域名ID
			var table = "";
			var lefttable = "";
			var firstTh = "域名";
			/** 数据列表 **/
			var dataList = json.data_list;
			
			if(dataType=="domainRegion"){
				firstTh = "地域  <a style='color: #333;' onclick='changeDataType(\"domain\")'><i class='icon-action-undo'></i></a>";
			}else if(dataType=="domainRegionAd"){
				firstTh = "地域  <a style='color: #333;' onclick='changeDataType(\"domainAd\")'><i class='icon-action-undo'></i></a>";
			}else if(dataType=="domainRegionNotAd"){
				firstTh = "地域  <a style='color: #333;' onclick='changeDataType(\"domainNotAd\")'><i class='icon-action-undo'></i></a>";
			}
			 var stDisplay = "";
		     var cDisplay = "";
		     var sDisplay = "";
		     var mtDisplay = "";
			    
		    if(num==1){
    	 	 stDisplay = "displaynone";
		     cDisplay = "displaynone";
		     sDisplay = "displaynone";
		     mtDisplay = "displaynone";
		    }else if(num==2){
		    	if(!stClick) stDisplay = "displaynone";
		    	if(!cClick) cDisplay = "displaynone";
		    	if(!sClick) sDisplay = "displaynone";
		    	if(!mClick) mtDisplay = "displaynone";
		    }
			if(dataList!=null && dataList.length>0){
				/* console.log("数据条数------>"+dataList.length); */
				var sumip = 1;
			    var sumpv = 1;
			    var sumuv = 1;
			    if(dataType=="domain"){
			    	sumip = json.siteStat.ip>0 ? json.siteStat.ip : 1;
			    	sumpv = json.siteStat.pv>0 ? json.siteStat.pv : 1;
			    	sumuv = json.siteStat.uv>0 ? json.siteStat.uv : 1;
			    }else if(dataType=="domainAd"){
			    	sumip = json.siteStat.adIP>0 ? json.siteStat.adIP : 1;
			    	sumpv = json.siteStat.adPv>0 ? json.siteStat.adPv : 1;
			    	sumuv = json.siteStat.aduv>0 ? json.siteStat.aduv : 1;
			    }else if(dataType=="domainNotAd"){
			    	sumip = json.siteStat.ip-json.siteStat.adIP>0 ? json.siteStat.ip-json.siteStat.adIP : 1;
			    	sumpv = json.siteStat.pv-json.siteStat.adPv>0 ? json.siteStat.pv-json.siteStat.adPv : 1;
			    	sumuv = json.siteStat.uv-json.siteStat.aduv>0 ? json.siteStat.uv-json.siteStat.aduv : 1;
			    }else if(dataType=="domainRegion"){
			    	sumip = json.domainStat.ip>0? json.domainStat.ip : 1;
			    	sumpv = json.domainStat.pv>0? json.domainStat.pv : 1;
			    	sumuv = json.domainStat.uv>0? json.domainStat.uv : 1;
			    }else if(dataType=="domainRegionAd"){
			    	sumip = json.domainAdStat.ip>0? json.domainAdStat.ip : 1;
			    	sumpv = json.domainAdStat.pv>0? json.domainAdStat.pv : 1;
			    	sumuv = json.domainAdStat.uv>0? json.domainAdStat.uv : 1;
			    }else if(dataType=="domainRegionNotAd"){
			    	sumip = json.domainNotAdStat.ip>0? json.domainNotAdStat.ip : 1;
			    	sumpv = json.domainNotAdStat.pv>0? json.domainNotAdStat.pv : 1;
			    	sumuv = json.domainNotAdStat.uv>0? json.domainNotAdStat.uv : 1;
			    }
			    
			    //console.log("sumip----------->",sumip);
			    //console.log("sumpv----------->",sumpv);
			    //console.log("sumuv----------->",sumuv);
			    
				for(var i=0;i<dataList.length;i++){
					var item = dataList[i];
					var firstTd = "";
					var tr = "";
				    var tr2 = "";
				    if(dataType=="domain"){
				    	firstTd ="<td title='"+item[24]+"'><span class='tdonly'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' data-target='#context-menu' data-toggle='dropdown' onclick='openMenu(this)' id='"+item[23]+"' domain='"+item[24]+"'>"+item[25]+"</a></span></td>";
				    }else if(dataType=="domainAd"){
				    	firstTd ="<td title='"+item[24]+"'><span class='tdonly'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' data-target='#context-menu' data-toggle='dropdown' onclick='openMenu(this)' id='"+item[23]+"' domain='"+item[24]+"'>"+item[25]+"</a></span></td>";
				    }else if(dataType=="domainNotAd"){
				    	firstTd ="<td title='"+item[24]+"'><span class='tdonly'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' data-target='#context-menu' data-toggle='dropdown' onclick='openMenu(this)' id='"+item[23]+"' domain='"+item[24]+"'>"+item[25]+"</a></span></td>";
				    }else if(dataType=="domainRegion"){
				    	firstTd ="<td><span class='tdonly'>"+item[23]+"</span></td>";
				    }else if(dataType=="domainRegionAd"){
				    	firstTd ="<td><span class='tdonly'>"+item[23]+"</span></td>";
				    }else if(dataType=="domainRegionNotAd"){
				    	firstTd ="<td><span class='tdonly'>"+item[23]+"</span></td>";
				    }
				    
				    var sumST = item[7]+item[8]+item[9]+item[10];
				    var sumC = item[11]+item[12]+item[13]+item[14];
				    var sumS = item[15]+item[16]+item[17]+item[18];
				    var sumM = item[19]+item[20]+item[21]+item[22];
				    var IP = item[0];
				    if(IP<=0)IP = 1;
				    var ipTd = "";//ip
				    var pvTd = "";//pv
				    var uvTd = "";//uv
				    var olduserTd = "";//老用户
				    var oldipTd = "";//老ip
				    var loginTd = "";//登录用户
				    var targetTd = "";//目标页
				    var sumSTTd = "";//总停留
				    var st1Td = "";//停留第一区间
				    var st2Td = "";//停留第二区间
				    var st3Td = "";//停留第三区间
				    var st4Td = "";//停留第四区间
				    var sumCTd = "";//总点击
				    var c1Td = "";//1区间
				    var c2Td = "";//2区间
				    var c3Td = "";//3区间
				    var c4Td = "";//4区间
				    var sumSTd = "";//总滚动
				    var s1Td = "";//1区间
				    var s2Td = "";//2区间
				    var s3Td = "";//3区间
				    var s4Td = "";//4区间
				    var sumMTd = "";//总移动
				    var m1Td = "";//1区间
				    var m2Td = "";//2区间
				    var m3Td = "";//3区间
				    var m4Td = "";//4区间

				    if(Percentagemin(item[0],sumip)<1){
				    	ipTd = "<td title='"+Percentage(item[0],sumip)+"'><span class='tdonly'>"+item[0]+"</span></td>";
				    }else{
				    	ipTd = "<td title='"+Percentage(item[0],sumip)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[0],sumip)+" '>"+
					  	"<span class='only'> "+item[0]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[1],sumpv)<1){
				    	pvTd = "<td title='"+Percentage(item[1],sumpv)+"'><span class='tdonly'>"+item[1]+"</span></td>";
				    }else{
				    	pvTd = "<td title='"+Percentage(item[1],sumpv)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[1],sumpv)+" '>"+
					  	"<span class='only'> "+item[1]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[2],sumuv)<1){
				    	uvTd = "<td title='"+Percentage(item[2],sumuv)+"'><span class='tdonly'>"+item[2]+"</span></td>";
				    }else{
				    	uvTd = "<td title='"+Percentage(item[2],sumuv)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[2],sumuv)+" '>"+
					  	"<span class='only'> "+item[2]+" </span></div></div></td>";
				    }
				    
				    if(Percentagemin(item[3],IP)<1){
				    	olduserTd = "<td title='"+Percentage(item[3],IP)+"'><span class='tdonly'>"+item[3]+"</span></td>";
				    }else{
				    	olduserTd = "<td title='"+Percentage(item[3],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[3],IP)+" '>"+
					  	"<span class='only'> "+item[3]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[4],IP)<1){
				    	oldipTd = "<td title='"+Percentage(item[4],IP)+"'><span class='tdonly'>"+item[4]+"</span></td>";
				    }else{
				    	oldipTd = "<td title='"+Percentage(item[4],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[4],IP)+" '>"+
					  	"<span class='only'> "+item[4]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[5],IP)<1){
				    	loginTd = "<td title='"+Percentage(item[5],IP)+"'><span class='tdonly'>"+item[5]+"</span></td>";
				    }else{
				    	loginTd = "<td title='"+Percentage(item[5],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[5],IP)+" '>"+
					  	"<span class='only'> "+item[5]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[6],IP)<1){
				    	targetTd = "<td title='"+Percentage(item[6],IP)+"'><span class='tdonly'>"+item[6]+"</span></td>";
				    }else{
				    	targetTd = "<td title='"+Percentage(item[6],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[6],IP)+" '>"+
					  	"<span class='only'> "+item[6]+" </span></div></div></td>";
				    }
				    if(Percentagemin(sumST,IP)<1){
				    	sumSTTd = "<td  title='"+Percentage(sumST,IP)+"'><span class='tdonly'>"+sumST+"</span></td>";
				    }else{
				    	sumSTTd = "<td title='"+Percentage(sumST,IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(sumST,IP)+" '>"+
					  	"<span class='only'> "+sumST+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[7],IP)<1){
				    	st1Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[7],IP)+"'><span class='tdonly'>"+item[7]+"</span></td>";
				    }else{
				    	st1Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[7],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[7],IP)+" '>"+
					  	"<span class='only'> "+item[7]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[8],IP)<1){
				    	st2Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[8],IP)+"'><span class='tdonly'>"+item[8]+"</span></td>";
				    }else{
				    	st2Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[8],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[8],IP)+" '>"+
					  	"<span class='only'> "+item[8]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[9],IP)<1){
				    	st3Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[9],IP)+"'><span class='tdonly'>"+item[9]+"</span></td>";
				    }else{
				    	st3Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[9],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[9],IP)+" '>"+
					  	"<span class='only'> "+item[9]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[10],IP)<1){
				    	st4Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[10],IP)+"'><span class='tdonly'>"+item[10]+"</span></td>";
				    }else{
				    	st4Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[10],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[10],IP)+" '>"+
					  	"<span class='only'> "+item[10]+" </span></div></div></td>";
				    }
				    if(Percentagemin(sumC,IP)<1){
				    	sumCTd = "<td class='onlytd' title='"+Percentage(sumC,IP)+"'><span class='tdonly'>"+sumC+"</span></td>";
				    }else{
				    	sumCTd = "<td title='"+Percentage(sumC,IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(sumC,IP)+" '>"+
					  	"<span class='only'> "+sumC+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[11],IP)<1){
				    	c1Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[11],IP)+"'><span class='tdonly'>"+item[11]+"</span></td>";
				    }else{
				    	c1Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[11],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[11],IP)+" '>"+
					  	"<span class='only'> "+item[11]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[12],IP)<1){
				    	c2Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[12],IP)+"'><span class='tdonly'>"+item[12]+"</span></td>";
				    }else{
				    	c2Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[12],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[12],IP)+" '>"+
					  	"<span class='only'> "+item[12]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[13],IP)<1){
				    	c3Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[13],IP)+"'><span class='tdonly'>"+item[13]+"</span></td>";
				    }else{
				    	c3Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[13],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[13],IP)+" '>"+
					  	"<span class='only'> "+item[13]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[14],IP)<1){
				    	c4Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[14],IP)+"'><span class='tdonly'>"+item[14]+"</span></td>";
				    }else{
				    	c4Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[14],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[14],IP)+" '>"+
					  	"<span class='only'> "+item[14]+" </span></div></div></td>";
				    }
				    if(Percentagemin(sumS,IP)<1){
				    	sumSTd = "<td class='onlytd' title='"+Percentage(sumS,IP)+"'><span class='tdonly'>"+sumS+"</span></td>";
				    }else{
				    	sumSTd = "<td title='"+Percentage(sumS,IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(sumS,IP)+" '>"+
					  	"<span class='only'> "+sumS+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[15],IP)<1){
				    	s1Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[15],IP)+"'><span class='tdonly'>"+item[15]+"</span></td>";
				    }else{
				    	s1Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[15],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[15],IP)+" '>"+
					  	"<span class='only'> "+item[15]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[16],IP)<1){
				    	s2Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[16],IP)+"'><span class='tdonly'>"+item[16]+"</span></td>";
				    }else{
				    	s2Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[16],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[16],IP)+" '>"+
					  	"<span class='only'> "+item[16]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[17],IP)<1){
				    	s3Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[17],IP)+"'><span class='tdonly'>"+item[17]+"</span></td>";
				    }else{
				    	s3Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[17],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[17],IP)+" '>"+
					  	"<span class='only'> "+item[17]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[18],IP)<1){
				    	s4Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[18],IP)+"'><span class='tdonly'>"+item[18]+"</span></td>";
				    }else{
				    	s4Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[18],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[18],IP)+" '>"+
					  	"<span class='only'> "+item[18]+" </span></div></div></td>";
				    }
				    if(Percentagemin(sumM,IP)<1){
				    	sumMTd = "<td class='onlytd' title='"+Percentage(sumM,IP)+"'><span class='tdonly'>"+sumM+"</span></td>";
				    }else{
				    	sumMTd = "<td title='"+Percentage(sumM,IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(sumM,IP)+" '>"+
					  	"<span class='only'> "+sumM+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[19],IP)<1){
				    	m1Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[19],IP)+"'><span class='tdonly'>"+item[19]+"</span></td>";
				    }else{
				    	m1Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[19],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[19],IP)+" '>"+
					  	"<span class='only'> "+item[19]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[20],IP)<1){
				    	m2Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[20],IP)+"'><span class='tdonly'>"+item[20]+"</span></td>";
				    }else{
				    	m2Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[20],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[20],IP)+" '>"+
					  	"<span class='only'> "+item[20]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[21],IP)<1){
				    	m3Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[21],IP)+"'><span class='tdonly'>"+item[21]+"</span></td>";
				    }else{
				    	m3Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[21],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[21],IP)+" '>"+
					  	"<span class='only'> "+item[21]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[22],IP)<1){
				    	m4Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[22],IP)+"'><span class='tdonly'>"+item[22]+"</span></td>";
				    }else{
				    	m4Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[22],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[22],IP)+" '>"+
					  	"<span class='only'> "+item[22]+" </span></div></div></td>";
				    }
				    
			  		tr+="<tr num='"+i+"'>" + firstTd+
			  		  ipTd+pvTd+uvTd+ 
					  olduserTd+oldipTd+loginTd+targetTd+
					  sumSTTd+st1Td+st2Td+st3Td+st4Td+
					  sumCTd+c1Td+c2Td+c3Td+c4Td+
					  sumSTd+s1Td+s2Td+s3Td+s4Td+
					  sumMTd+m1Td+m2Td+m3Td+m4Td+
					  "</tr>";
					  table+=tr;
				  if(num==2){
					  tr2+="<tr>"+firstTd+
					  ipTd+
						"</tr>";
					lefttable+=tr2;
				  }
				}
				
			}
			if(num==1){
				jQuery("#ip").html(json.siteStat.ip);
				jQuery("#pv").html(json.siteStat.pv);
				jQuery("#adIP").html(json.siteStat.adIP);
				jQuery("#adPv").html(json.siteStat.adPv);
				jQuery(".DTFC_LeftHeadWrapper #firstTh").html(firstTh);
				jQuery("#tbody").empty();
				jQuery("#tbody").append(table);
				jQuery(".DTFC_LeftBodyWrapper #tbody").empty();
				jQuery(".DTFC_LeftBodyWrapper #tbody").append(lefttable);
				jQuery("#lasttime").html("最后一次更新时间  "+json.lasttime);
			}else if(num==2 && timestamp==json.timestamp){
				jQuery("#ip").html(json.siteStat.ip);
				jQuery("#pv").html(json.siteStat.pv);
				jQuery("#adIP").html(json.siteStat.adIP);
				jQuery("#adPv").html(json.siteStat.adPv);
				jQuery(".DTFC_LeftHeadWrapper #firstTh").html(firstTh);
				jQuery("#tbody").empty();
				jQuery("#tbody").append(table);
				jQuery(".DTFC_LeftBodyWrapper #tbody").empty();
				jQuery(".DTFC_LeftBodyWrapper #tbody").append(lefttable);
				jQuery("#lasttime").html("最后一次更新时间  "+json.lasttime);
			}
			
			sessionData = JSON.stringify(json);//将json对象转换为 json字符串
			sessionStorage.setItem("json", sessionData);//将json字符串保存到session中
			
			
		}
}
	 
//单独查看
function onlyOne(name){
	isRefresh = "false";
	clearTimeout(t);
	App.startPageLoading({animate: !0});//开启 加载 动画
	search = name;
	jQuery("#search").val(name);
	jQuery("#searchImg").attr("class","icon-close");
	jQuery("#searchImg").css("cursor","pointer");
	jQuery("#searchImg").attr("onclick","clearSearch()");
	ajaxRefreshPage();
	isRefresh = "true";
	jQuery("#pauseOrplay i").removeClass("icon-control-play");
	jQuery("#pauseOrplay i").addClass("icon-control-pause");
	
}
/** ------改变页面数据类型-------------**/
function changeDataType(type,domain_Id){
	isRefresh = "false";
	clearTimeout(t);
	App.startPageLoading({animate: !0});//开启 加载 动画
	if(type=="all"){
		if(dataType.indexOf("domainRegion")>=0){
			dataType = "domainRegion";
			jQuery("#search").attr("disabled","disabled");
		}else{
			dataType = "domain";
			jQuery("#search").attr("disabled",false);
		}
	}else if(type=="Ad"){
		if(dataType.indexOf("domainRegion")>=0){
			dataType = "domainRegionAd";
			jQuery("#search").attr("disabled","disabled");
		}else{
			dataType = "domainAd";
			jQuery("#search").attr("disabled",false);
		}
	}else if(type=="NotAd"){
		if(dataType.indexOf("domainRegion")>=0){
			dataType = "domainRegionNotAd";
			jQuery("#search").attr("disabled","disabled");
		}else{
			dataType = "domainNotAd";
			jQuery("#search").attr("disabled",false);
		}
	}else{
		if(type.indexOf("domainRegion")>=0){
			domainId = domain_Id;
			jQuery("#search").attr("disabled","disabled");
		}else if(type.indexOf("domain")>=0){
			jQuery("#search").attr("disabled",false);
		}
		
		dataType = type;
	}
	
	
	ajaxRefreshPage();
	isRefresh = "true";
	jQuery("#pauseOrplay i").removeClass("icon-control-play");
	jQuery("#pauseOrplay i").addClass("icon-control-pause");
	
}
/** --------------分页查询 -------------**/
function graphicLoading(obj) {
	var pageNo = 1;

	if (obj == 1) { //表示下页数据
		pageNo = $("#forward").attr("data-value");
	} else if (obj == -1) { //表示上月数据
		pageNo = $("#backoff").attr("data-value");
	} else {
		//表示被人客户端恶意修改参数
		return;
	}
	if (null == pageNo || "" == pageNo) {
		//toastr.success("已经没有数据了！");
		return;
	} else {
		//ajax读取 上一月的数据
		jQuery.ajax({
			url : "${pageContext.request.contextPath}/ajaxLoadData.do?pageNo=" + pageNo,
			success : function(data) {
				var json = eval('(' + data + ')');
				if (json.success) {
					$("#forward").attr("data-value", json.nextMonth); //下一页
					$("#backoff").attr("data-value", json.lastMonth); //上一页
					t(json.order); //调用图形列表方法
				} else {
					/* $("#forward").attr("data-value", json.nextMonth); //下一页
					$("#backoff").attr("data-value", json.lastMonth); //上一页
					t(json.order) */
					//toastr.success(json.message);
				}
			}
		});
	}
}
//打开菜单
function openMenu(a,event){
	
	var backUrl = webPath+"/dashboard.jhtm?dataType="+dataType+"&firstTd="+search+"&top="+ipTop+"&isRefresh="+isRefresh+"&isRetrun=true";
	var id = jQuery(a).attr("id");
	var domain = jQuery(a).attr("domain");
	 jQuery("#onlyOne").attr("onclick","onlyOne('"+domain+"')");
	jQuery("#oneTime").attr("onclick","gotoPage('"+webPath+"/domainTimechartList_one.jhtm?domainId="+id+"&dataType="+dataType+"&domain="+domain+"','"+backUrl+"')");
	jQuery("#AdVSNotAd").attr("onclick","gotoPage('"+webPath+"/dashboard_domainTime.jhtm?domainId="+id+"&domain="+domain+"&dataType="+dataType+"','"+backUrl+"')");
	if(dataType=="domain"){
		jQuery("#region").attr("onclick","changeDataType('domainRegion',"+id+")");
	}else if(dataType=="domainAd"){
		jQuery("#region").attr("onclick","changeDataType('domainRegionAd',"+id+")");
	}else if(dataType=="domainNotAd"){
		jQuery("#region").attr("onclick","changeDataType('domainRegionNotAd',"+id+")");
	} 
	
	var e = event || window.event;
	var yy  = parseInt(e.screenY-120);
	var  xx = parseInt(e.screenX);
	var menuHeight = parseInt(jQuery(jQuery(a).attr("data-target")+" ul").css("height"));//菜单高度
	var cHeight = parseInt(document.documentElement.clientHeight)-menuHeight;//页面可视高度
	if(yy+menuHeight>=cHeight){
		jQuery(jQuery(a).attr("data-target")).css({"top":yy-menuHeight,"left":xx});
	}else{
		jQuery(jQuery(a).attr("data-target")).css({"top":yy,"left":xx});
	}
	
}
//百分比
function Percentagemin(num, total){
	return Math.round(num / total * 10000) / 100.00;
}
//百分比
function Percentage(num, total) { 
   return (Math.round(num / total * 10000) / 100.00 + "%");// 小数点后两位百分比
}
//百分比 （超过100 按100算）
function PercentageMax(num, total){
	var p = Math.round(num / total * 10000) / 100.00 >100 ? 100 : Math.round(num / total * 10000) / 100.00;
	return (p+"%");
}
/**------  改变top值  ------**/
function changeTop(a,num){
	isRefresh = "false";
	clearTimeout(t);
	jQuery("#topul li").removeClass("active");
	jQuery(a).addClass("active");
	
	App.startPageLoading({animate: !0});//开启 加载 动画
	if(num==50){
		jQuery("#top").html(" TOP "+num +"&nbsp;&nbsp;");
	}else{
		jQuery("#top").html(" TOP "+num);
	}
	
	ipTop = num;
	ajaxRefreshPage();
	isRefresh = "true";
	jQuery("#pauseOrplay i").removeClass("icon-control-play");
	jQuery("#pauseOrplay i").addClass("icon-control-pause");
}
/** 修改td样式 **/
function changeDisplay(a,data){
	 var i = jQuery(a).find("i");
	  if(jQuery(i).attr("class")=="icon-magnifier-add"){
		  if(data == "st"){
			  stClick = true;
		  }else if(data == "c"){
			  cClick = true;
		  }else if(data == "s"){
			  sClick = true;
		  }else if(data == "m"){
			  mClick = true;
		  }
		  jQuery(i).removeClass("icon-magnifier-add");
		  jQuery(i).addClass("icon-magnifier-remove");
	
    	   jQuery("[event='"+data+"']").each(function (){
			  jQuery(this).toggleClass("displaynone");
		  });  

		  jQuery(".dataTables_scrollHeadInner").css("width","4000px");
		  
		  var left =  jQuery(".dataTables_scrollBody").scrollLeft();
		  jQuery(".dataTables_scrollBody").scrollLeft(left+500);
	  }else if(jQuery(i).attr("class")=="icon-magnifier-remove"){
		  if(data == "st"){
			  stClick = false;
		  }else if(data == "c"){
			  cClick = false;
		  }else if(data == "s"){
			  sClick = false;
		  }else if(data == "m"){
			  mClick = false;
		  }
		  jQuery(i).removeClass("icon-magnifier-remove");
		  jQuery(i).addClass("icon-magnifier-add");
		  
		  //jQuery("[event="+data+"]").toggleClass("displaynone");
		   jQuery("[event='"+data+"']").each(function (){
				  jQuery(this).toggleClass("displaynone");
			  });  
	  }
	 
}
/** 清空搜索框 **/
function clearSearch(){
	isRefresh = "false";
	clearTimeout(t);
	App.startPageLoading({animate: !0});//开启 加载 动画
	search = "";
	jQuery("#search").val("");
	jQuery("#searchImg").attr("class","icon-magnifier");
	jQuery("#searchImg").css("cursor","auto");
	jQuery("#searchImg").attr("onclick","");
	ajaxRefreshPage();
	isRefresh = "true";
	jQuery("#pauseOrplay i").removeClass("icon-control-play");
	jQuery("#pauseOrplay i").addClass("icon-control-pause");
}

function firstAppend(){
	var str = "<tr></tr>" +
				
				"";
	jQuery("#tbody").append(str);
	
}
