
var list_map = new Array()

var current=0;




//保存跳转
function gotoPage(url){
	if(null==url || undefined==url){
		if(current>=list_map.length){
			alert("已经是最前页");
			return false;
		}
		url=list_map[current];
		current+=1;
		
	}else	if(list_map.length==0){
		list_map.push(url);
		current+=1;
	}else if(list_map.length>current&&list_map[current+1]!=url){ //当前地址小于总记录数 并且 数组中的下一页和当前需要跳转的不同 则添加新数据 并删除多余的数据
		                 
		list_map.splice(current,list_map.length-current,url);
		current+=1;
	}else if(current==list_map.length && list_map[current-1]!=url){
		list_map.push(url);
		current+=1;
	}

	Layout.loadAjaxContent(url);
	
}



//前进  或者后退 index 1 前进  -1 后退        gotoHistoryPage
function gotoHistoryPage(){
		//alert(list_map[current-2]);
	    if(current<2){
	    	Layout.loadAjaxContent(list_map[0]);
	    }else{
	    	Layout.loadAjaxContent(list_map[current-2]);
			current-=1;
	    }
}

 
 
//刷新数据
function refreshPage(){
	Layout.loadAjaxContent(list_map[current-1]);
}

