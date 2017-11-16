var browsingHistory = new Array();
var currentPageNo=0;

/**
 * 记录历史请求页面
 */
$(document).ready(function(){
  $(".ajaxify").click(function(){
	  var url = $(this).attr("href");
	  
	  /** 首次记录 **/
		if(browsingHistory.length==0){
			browsingHistory.push(url);
			currentPageNo+=1;		
		/** 后退后跳转 
		 	当前地址小于总记录数 并且 数组中的下一页和当前需要跳转的不同 则添加新数据 并删除多余的数据    
		 **/
	 	}else if(browsingHistory.length>currentPageNo&&browsingHistory[currentPageNo+1]!=url){ //
			browsingHistory.splice(currentPageNo,browsingHistory.length-currentPageNo,url);
			currentPageNo+=1;
		}else if(currentPageNo==browsingHistory.length && browsingHistory[currentPageNo-1]!=url){
			browsingHistory.push(url);
			currentPageNo+=1;
		}else{
			/**
			 * 忽略重复的请求记录
			 */
		}  
  });
});

/**
 * 跳转页面
 */
var gotoPage = function(url){
	
	console.log("gotoPage->"+url);
	
	/** 首次记录 **/
	if(browsingHistory.length==0){
		browsingHistory.push(url);
		currentPageNo+=1;		
	/** 后退后跳转 
	 	当前地址小于总记录数 并且 数组中的下一页和当前需要跳转的不同 则添加新数据 并删除多余的数据    
	 **/
 	}else if(browsingHistory.length>currentPageNo&&browsingHistory[currentPageNo+1]!=url){ //
		browsingHistory.splice(currentPageNo,browsingHistory.length-currentPageNo,url);
		currentPageNo+=1;
	}else if(currentPageNo==browsingHistory.length && browsingHistory[currentPageNo-1]!=url){
		browsingHistory.push(url);
		currentPageNo+=1;
	
	}else{
		/**
		 * 忽略重复的请求记录
		 */
	}

	Layout.loadAjaxOnly(url);
};


/** 
 * 前进或后退
 * gotoHistoryPage(-1),后退1页,gotoHistoryPage(1);前进一页
 */
var gotoHistoryPage = function(step){
		var offset = currentPageNo + step;
		console.log("gotoHistoryPage currentPageNo->"+currentPageNo+",step->"+step+",offset->"+offset);
		
		if(offset < 1){
			//无法退
			return;
		}
		
		if(offset > browsingHistory.length){
			//无法前进
			return;
		}
		
		var url = browsingHistory[offset-1];
		console.log("gotoHistoryPage->"+url);
	
		Layout.loadAjaxOnly(url);
		currentPageNo = offset;
};

/**
 * 刷新当前页面
 */
var refreshPage = function(){
	var url = browsingHistory[currentPageNo-1];
	console.log("refreshPage url->"+url);
	Layout.loadAjaxOnly(url);
};


var handleValidation = function(formId) {
	var form1 = $(formId);
	var error1 = $('.alert-danger', form1);
	var success1 = $('.alert-success', form1);

	 form1.validate({
         errorElement: 'span', //default input error message container
         errorClass: 'help-block help-block-error', // default input error message class
         focusInvalid: false, // do not focus the last invalid input
         ignore: "", // validate all fields including form hidden input
         messages: {
             payment: {
                 maxlength: jQuery.validator.format("Max {0} items allowed for selection"),
                 minlength: jQuery.validator.format("At least {0} items must be selected")
             }
         },
         invalidHandler: function(event, validator) { //display error alert on form submit       
        	 console.log('invalidHandler');
             success1.hide();
             error1.show();
             App.scrollTo(error1, -200);
         },

         errorPlacement: function(error, element) {
        	 console.log('errorPlacement');
             if (element.is(':checkbox')) {
                 error.insertAfter(element.closest(".md-checkbox-list, .md-checkbox-inline, .checkbox-list, .checkbox-inline"));
             } else if (element.is(':radio')) {
                 error.insertAfter(element.closest(".md-radio-list, .md-radio-inline, .radio-list,.radio-inline"));
             } else {
                 error.insertAfter(element); // for other inputs, just perform default behavior
             }
         },

         highlight: function(element) { // hightlight error inputs
        	 console.log('highlight');
             $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
         },

         unhighlight: function(element) { // revert the change done by hightlight
        	 console.log('unhighlight');
             $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
         },
         
         submitHandler: function(form1) {
        	var submitBtn = $('button[type=submit]');
        	if(!submitBtn.hasClass("disabled")){
        		submitBtn.addClass("disabled");
        		$(form1).ajaxSubmit(function(ret) {
         	    	if(ret.success){
         	    		console.log('submitHandler2');
             	    	gotoHistoryPage(-1);
         	    	}else{
         	    		toastr.error(ret.message);
         	    		$('button[type=submit]').removeClass("disabled");
         	    	}
         	      return false;
         	   });
        	}	
         }
     });;
};

var initatepicker = function(){
	$('.datepick').datepicker({autoclose:true});
	$('.datetimepick').datetimepicker({language:'zh-CN',defaultTime:false,autoclose:true});
	
	$(".daterangepick").each(function(){
		var _startDate = $(this).next().val();
		var _endDate = $(this).next().next().val();

		if(_startDate==""){
			_startDate = moment().subtract("days", 29);
			_endDate = moment();
		}
		
		var dp = $(this).daterangepicker({
	        opens: App.isRTL() ? "left" : "right",
	        dateLimit: {
	            days: 92
	        },
	        autoApply:true,
	        autoUpdateInput:true,
	        maxDate:new Date(),
	        startDate:_startDate,
	        endDate:_endDate,
	        ranges: {
	        	今天: [moment(), moment()],
	            昨天: [moment().subtract("days", 1), moment().subtract("days", 1)],
	            "最近 7 天": [moment().subtract("days", 6), moment()],
	            "最近 30 天": [moment().subtract("days", 29), moment()],
	            "本月": [moment().startOf("month"), moment().endOf("month")],
	            "上月": [moment().subtract("month", 1).startOf("month"), moment().subtract("month", 1).endOf("month")]
	        },
	        locale: {
	        	format:"YYYY-MM-DD",
	            separator: " - ",
	            applyLabel: "应用",
	            cancelLabel: '取消',
	            fromLabel: "提交",
	            toLabel: "To",
	            customRangeLabel: "自定义",
	            daysOfWeek: ["日", "一", "二", "三", "四", "五", "六"],
	            monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
	            firstDay: 1
	        }
	    }, function(start, end , label) {
	      console.log(start,end,label);
	      //this.element.val(start.format("YYYY-MM-DD") + " -> " + end.format("YYYY-MM-DD"));
	      var _startDate = this.element.next();
	      var _endDate = this.element.next().next();
	      _startDate.val(start.format("YYYY-MM-DD"));
	      _endDate.val(end.format("YYYY-MM-DD"));
	      
	      //this.element.val(start.format("MM-DD") + " -> " + end.format("MM-DD"));
	    });

		if( $(this).next().val() == ""){
			$(this).val("");
		}
	});
};

var initOpts = function(){
	$("[data-opt-key]").each(function(){
		if(allowOpts.get($(this).attr("data-opt-key"))==null){
			$(this).hide();
		}
	});
}

var allowOpts =  {
    /** 存放键的数组(遍历用到) */
    keys : [
                 '/all-region/delete',
                 '/all-region/create',
                 '/all-region/edit',
                 '/all-region/export',
                 ''
                 ],
    /** 存放数据 */
    data:null,
    get:function(key) {
    	if(this.data == null){
    		this.data = new Object();
    		for(var i in this.keys){
    			this.data[this.keys[i]]=this.keys[i];
    		}
    	}
        //return this.data[key];
    	return 1;
    }
}