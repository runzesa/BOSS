//取得由window.showModalDialog("../workflow/checkout.jsp",xmlDoc,"dialogWidth=400px;dialogHeight=300px");第二个参数传进来的
var xmlDoc = window.dialogArguments;

var radioMarginLeft = 20;//radio/hidden的距左间隔,单位px

window.onload = function(){
	//当前任务信息
	createNowMission();

	//创建流转列表
	var radioIndex = 0;//流转连接线的个数
	var nextObj = new Object();//连接线各种参数
	var transitions = $(xmlDoc).find('returnNext > transition');
	var radio_hidden_type = transitions.length>1?"radio":"hidden";//若连接线为1则不显示radio
	
	$(transitions).each(function(){
		nextObj.outName = $(this).attr('name');//流转连接线的name
		
		var node = $("next",this);
		nextObj.name = $(node).attr('name')+"：";//后续节点name
		tagName = $(node).attr('type');//后续节点的类型(若为fork或join就继续读子节点的名字)
		
		var tr2,td21,td22;//流转->行
		
		var radio_hidden = "";//流转选择:显示radio or 直接放个hidden
		var nameinput = "";
		var idinput = "";
		var button = "";
		
		//连接线name的td的控件是radio/hidden,value等于连接线的序号
		radio_hidden = $('<input/>')
					.attr("type",radio_hidden_type)
					.attr("value",radioIndex)
					.attr("style","width:30px;")
					.attr("name","outradio")
					.attr("id","outradio")
					;
		//若为任务/结束/判断节点
		if(tagName=="task" || tagName=="end" || tagName=="decision"){
			//第一个td的内容(nextObj.name+radio)
			nextObj.userType = $(node).attr('usertype');//流转的用户类型(结束/静态用户/用户/【部门/角色->还未加】)
			nextObj.user = $(node).attr('user');//接收人关键字,相当于map的key
			nextObj.userid = $(node).attr('userid');//接收人id,相当于map的value
			nextObj.username = $(node).attr('username');//接收人用户名,用于显示
			var readonly = $(node).attr('readonly');//是否可修改
			
			//给radio/hidden赋各种值
			$(radio_hidden).data("outName",nextObj.outName)
						.data("tagName",tagName)
						.data("userType",nextObj.userType)
						.data("user",nextObj.user);
			
			//创建第二个td的text,hidden,button
			var temTD2Obj = createTD2(nextObj,radioIndex);

			nameinput = temTD2Obj.nameinput;//存name的text
			idinput = temTD2Obj.idinput;//存id的hidden
			button = temTD2Obj.button;//button按钮
			
			//user key只要不是init_user,并且传来的xml里radyonly=true->不允许修改->不显示button
			if((readonly!=undefined && nextObj.userType == 'static_user' && readonly=="true") || nextObj.user=="init_user")
				button="";
			
			//创建第一个td的内容
			td21 = createTD1_task_end_decision(radio_hidden, nextObj.name);
			
			//第二个td的内容
			td22 = $('<td></td>')
					.attr("style","text-align:left;padding:0 0 0 5px;")
					.append(nameinput)
					.append(idinput)
					.append(button);
		
		//虽然join之后跟的必然是一个节点,但传入的xml里它和fork一样的格式所以放在这里解析
		}else if(tagName=="fork" || tagName=="join"){
			//连接线name的td的控件的参数
			$(radio_hidden).data("outName",nextObj.outName)
							.data("tagName",tagName);

			//第一个td的内容(除文本外)
			td21 = createTD1_fork_join(radio_hidden);
			
			//第二个td
			td22 = $('<td></td>')
				.attr("style","text-align:left;padding:0 0 0 5px;");
			var users = "";//用户变量
			//var buttonids = "";
			var index2 = 0;//text的id的后续编号
			
			//文本的div
			var td21_div = $("<div></div>")
					.attr("style","padding-top:1px;padding-bottom:1px;");
			
			//td的高度,没有这个高度无法垂直剧中
			var td21_height = 6;
			
			$("childnext",node).each(function(){
				//每新增一个文本框加20手动增加td的高度
				td21_height+=20;
				
				//给第一个td添加文本内容
				$(td21_div).append(createTD1_fork_join_NameDIV($(this).attr("name")));

				//用户变量
				var user = $(this).attr("user");
				//用户类型
				var usertype = $(this).attr("usertype");
				users += user+",";
				
				nextObj.userType = usertype;//用户类型
				nextObj.user = user;//用户变量
				nextObj.userid = $(this).attr("userid");//默认的用户id
				nextObj.username = $(this).attr('username');//默认的用户name
				var readonly = $(this).attr('readonly');//是否可修改
				
				//创建第二个td的内容
				var temTD2Obj = createTD2(nextObj,radioIndex+"_"+index2,user);
				
				nameinput = temTD2Obj.nameinput;
				idinput = temTD2Obj.idinput;
				button = temTD2Obj.button;
				//user key只要不是init_user,并且传来的xml里radyonly=true->不允许修改->不显示button
				if((readonly!=undefined && nextObj.userType == 'static_user' && readonly=="true") || nextObj.user=="init_user")
					button="";
				
				//第二个td添加内容
				$(td22).append(nameinput)
					.append(idinput)
					.append(button)
					.append($("<br/>"));
				index2++;//text的id的后续编号++
				radio_hidden.data("userType",nextObj.userType)//TODO 用户类型,每次都覆盖...没啥用
			});
			//td1里添加文本div,并添加高度的css属性
			$(td21).append(td21_div).css("height",td21_height+"px");
			
			nextObj.user = users;//TODO 同下
			radio_hidden.data("user",nextObj.user);//TODO 这个判断中实际没有用到,fork的情况中用户变量直接从text里取了
			
		}else{
			alert("Error in checkout.js:\nUnknow tagName->"+tagName)
		}
		//创建对应tr,td及其属性
		tr2 = $('<tr></tr>');
		//组合
		tr2.append(td21).append(td22);
		
		$('#nextdata').append(tr2);
		radioIndex += 1;
	});

}

/**
 * 创建连接线目标name的div
 * @param name 显示值
 * @return 放有name的div
 */
function createTD1_fork_join_NameDIV(name){
	var td21_div_child = $("<div></div>")
					.attr("style","height:18px;padding-top:5px;margin-top:1px;margin-bottom:1px")
					.append(name+"：");
	return td21_div_child;
}

/**
 * 创建分支，汇聚的第一个td
 * @param obj 控件
 * @return
 */
function createTD1_fork_join(obj){
	//占行的span,使radio/hidden居中
	var chooseSpan = $("<span></span>")
			.attr("style","width:0;height:100%;display:inline-block;vertical-align:middle;");
	
	//span和控件都塞到div里
	var chooseDIV = $("<div></div>")
			.attr("style","height:100%;float:left;margin-left:"+radioMarginLeft+"px")
			.append(chooseSpan)
			.append(obj);
	
	//第一个td的内容(除文本外)
	var td1 = $('<td></td>')
		.attr("align","right")
		.attr("valign","middle")
		.attr("style","background:url(../images/icon/insert_td_bg.gif) repeat-x bottom;")
		.append(chooseDIV);
	return td1
}

/**
 * 创建任务/结束/判断的第一个td
 * @param obj 控件
 * @param name 显示文字
 * @return td
 */
function createTD1_task_end_decision(obj,name){
	//单选按钮的div
	var chooseDIV = $("<div></div>")
			.attr("style","float:left;;margin-left:"+radioMarginLeft+"px;")
			.append(obj);
	
	//文本的div
	var nameDiv = $("<div></div>")
			.attr("style","float:right;margin-top:3px;")
			.append(name);
	
	//第一个td的内容
	var td1 = $('<td></td>')
			.attr("align","right")
			.attr("valign","middle")
			.attr("style","height:30px;background:url(../images/icon/insert_td_bg.gif) repeat-x bottom;")
			.append(chooseDIV)
			.append(nameDiv);
			
	return td1;
}

/**
 * 创建当前任务的信息
 */
function createNowMission(){
	//创建流程流转的内容的tr
	var currentName = $("current",xmlDoc).attr("name");//当前任务名
	var currentId = $("current",xmlDoc).attr("id");//任务id
	
	//创建第二个tr
	var tr = $('<tr></tr>');
	
	var td1 = $('<td></td>')
			.attr("align","right")
			.attr("style","width:40%;height:30px;background:url(../images/icon/insert_td_bg.gif) repeat-x bottom;")
			.text("当前任务：");
	
	var td2 = $('<td></td>')
			.attr("style","text-align:left;padding:0 0 0 5px;")
			.text(currentName);
	
	var taskIDHidden = $('<input/>')
			.attr("type","hidden")
			.attr("value",currentId)
			.attr("name","taskid")
			.attr("id","taskid");
	
	//把tr放到table
	$(td2).append(taskIDHidden);
	$(tr).append(td1).append(td2);
	$('#currentdata').append(tr);
}

/**
 * 创建连接线列表的第二个td
 * @param nextObj 含有各种下一节点参数的obj
 * @param radioIndex 当前tr的序号
 * @param user 用户
 * @return
 */
function createTD2(nextObj,radioIndex,user){
	var returnObj = new Object();
	returnObj.nameinput = "";
	returnObj.idinput = "";
	returnObj.button = "";
	
	if(nextObj.userType == 'static_user'){//若为静态接收者
		//创建text文本框
		returnObj.nameinput = $('<input/>')
				.attr("type","text")
				.attr("readonly","true")
				.attr("style","margin-top:1px;margin-bottom:1px;width:160px;background:url(../images/icon/bg_input_text.png) no-repeat;height:18px;border:1px solid #B5B8C8;padding:3px 0 0 3px;vertical-align:middle;")
				.attr("name","nameinput"+radioIndex)
				.attr("id","nameinput"+radioIndex)
				.attr("value",nextObj.username);
		//创建文本框内容对应的id值
		returnObj.idinput = $('<input/>')
				.attr("type","hidden")
				.attr("readonly","true")
				.attr("name","idinput"+radioIndex)
				.attr("id","idinput"+radioIndex)
				.attr("value",nextObj.userid)
				.data("user",user==undefined?"":user);
		//button
		returnObj.button = $('<input/>')
				.attr("type","button")
				.attr("style","width:50px;margin:0 0 0 5px;")
				.attr("value","选择")
				.data("radioIndex",radioIndex)
				.click(function(){
					var radioid =  $(this).data("radioIndex");
					window.open('usertree.jsp?formname=form1&nameinput=nameinput'+ radioid +'&idinput=idinput'+radioid,'usertree','scrollbars=yes,status=yes,width=400,height=600');
				});
		//下面内容原理基本同上,只不过value,id值可能不太一样
	}else if(nextObj.userType == 'assignee'){//若为接收[人]
		returnObj.nameinput = $('<input/>')
				.attr("type","text")
				.attr("style","margin-top:1px;margin-bottom:1px;width:160px;background:url(../images/icon/bg_input_text.png) no-repeat;height:18px;border:1px solid #B5B8C8;padding:3px 0 0 3px;vertical-align:middle;")
				.attr("name","nameinput"+radioIndex)
				.attr("id","nameinput"+radioIndex)
				.attr("value","");
		
		returnObj.idinput = $('<input/>')
				.attr("type","hidden")
				.attr("name","idinput"+radioIndex)
				.attr("id","idinput"+radioIndex)
				.attr("value","")
				.data("user",user==undefined?"":user);
		
		returnObj.button = $('<input/>')
				.attr("type","button")
				.attr("style","width:50px;margin:0 0 0 5px;")
				.attr("value","选择")
				.data("radioIndex",radioIndex)
				.click(function(){
					var radioid =  $(this).data("radioIndex");
					window.open('usertree.jsp?formname=form1&nameinput=nameinput'+ radioid +'&idinput=idinput'+radioid,'usertree','scrollbars=yes,status=yes,width=400,height=600');
				});
		
	}else if(nextObj.userType == 'endprocess'){//若为结束流程
		returnObj.nameinput = "结束流程";
		returnObj.idinput = $('<input/>')
				.attr("type","hidden")
				.attr("name","idinput"+radioIndex)
				.attr("id","idinput"+radioIndex)
				.attr("value",nextObj.user)
				.data("user",user==undefined?"":user);
		
	}else if(nextObj.userType == 'decisionprocess'){//若为判断流程
		returnObj.nameinput = "自动流转节点";
		returnObj.idinput = $('<input/>')
				.attr("type","hidden")
				.attr("name","idinput"+radioIndex)
				.attr("id","idinput"+radioIndex)
				.attr("value",nextObj.user==undefined?"":nextObj.user)
				.data("user",user==undefined?"":user)
				.data("type","decision");
		
	}else{
		returnObj.nameinput = "";
		returnObj.idinput = "";
		returnObj.button = "";
	}
	return returnObj;
}

/**
 * 提交任务
 */
function taskSubmit(){
	//var taskId = $('input[name="taskid"]').val();
	var taskId = $('#taskid').val();//任务id
	var tagname = 'null';//下一标签名
	var outRadio = '';//text的值
	var outValue = '';//接收人id
	var outTo = '';//流转连接线的name
	var outType = '';//用户类型
	var assValue = '';//接收人key
	var check = $('input:checked');//选中的radio
	
	//若没有radio,则取hidden
	if(check.size()==0 && $("input[type='radio']").size()==0){
		check = $("#outradio");
	}
	if(check.size()!=0){
		tagname = $(check).data("tagName");
		var type = "";//检查后面跟的是否是判断任务
		if(tagname=="fork" || tagname=="join"){//fork后的任务接收人可能为多个,join也在这里是因为和fork创建方式相同
			outRadio = check.val();//第几个radio
			//循环连接线的text
			$($("input[name*='idinput"+outRadio+"_']")).each(function(){
				//用户变量
				var user = $(this).data("user");
				type = $(this).data("type");
				//再取出用户变量对应的用户id值
				if(user!=undefined && user!=""){
					assValue += user+",";
					if($(this).val()!="")
						outValue += $(this).val()+",";
					else{
						outValue = "";
						return false;
					}
				}
			});
			//是否有选择用户,并且后面跟的不是判断节点
			if(outValue=="" && (type==undefined || type==null)){
				alert("请选择流程接受用户");
				return;
			}
			
			//连接线name
			outTo = $(check).data("outName");
			//用户类型
			outType = $(check).data("userType");
		}else{//如果接收人是一个人->直接取text的值即可
			outRadio = check.val();
			outValue = $("#idinput"+outRadio).val();
			type = $("#idinput"+outRadio).data("type");

		//	alert(type)
			if(outValue=="" && (type==undefined || type==null)){
				alert("请选择流程接受用户");
				return;
			}
			//debug//这里不能直接存名字吧?!
			outTo = $(check).data("outName");
			outType = $(check).data("userType");
			assValue = $(check).data("user");
		}
	}else{
		alert("请选择流转节点");
		return;
	}
	//'taskid='+任务id+'&outto='+流转连接线的name+'&outtype='+流转类型+'&outvalue='+接收人id+'&assvalue='+接收人key
	var postText = 'tagname='+tagname+'&taskid='+taskId+'&outto='+outTo+'&outtype='+outType+'&outvalue='+outValue+'&assvalue='+assValue;
	//alert(postText);
	XMLHttp.sendReq('POST', 'checkout.do', postText, result);
}

/**
 * 提交后的返回方法
 */
function result(xmlObject){
	xmlDoc = xmlObject.responseXML;
	if ($(xmlDoc).find('returnResult > result').attr('return') == "success") {
		alert("保存成功");
		returnValue = 'success';
	}else {
		alert("保存失败");
		returnValue = 'error';
	}
	self.close();
}