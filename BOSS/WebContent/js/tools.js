
//设置得到数据的快捷方式
$ = function(id){
	return document.getElementById(id);
}

//得到服务器返回的主数据
function getServerTableRows(xmlObject){
	var xmlDoc=xmlObject.responseXML;
	var rows=xmlDoc.getElementsByTagName("row");
	return rows;
}

//得到服务器Action的状态，例如session是否失效等
function getActionState(xmlObject){
	var xmlDoc=xmlObject.responseXML;
	var actionState=xmlDoc.getElementsByTagName("actionState");
	var field=actionState[0].getElementsByTagName("field");
	return field[0].getAttribute("value");
}

//根据服务器状态，进行页面跳转
function stateResult(actionState){
	if(actionState=="noSession"){
		alert("对不起，系统已超时！");
		parent.window.location = "../login.jsp";
	}else if(actionState=="NullPointerException"){
		alert("对不起，系统出现内部错误，请与系统管理员联系！");
		parent.window.location = "../login.jsp";
	}
}

//增加工具条内容
function addPageBar(barName,xmlObject){
	if(barName!=null){
		var xmlDoc=xmlObject.responseXML;
		var pageBar=xmlDoc.getElementsByTagName("pageBar");
		var field=pageBar[0].getElementsByTagName("field");
		document.getElementById(barName).innerHTML=field[0].getAttribute("value");
		document.getElementById('pagergo').style.display = 'block';
	}
}

//关闭分页开关后取消pagebar的显示
function noPageBar(barName){
	if(barName!=null){
		document.getElementById(barName).innerHTML = '';
		document.getElementById('pagergo').style.display = 'none';
	}
}

//切换分页状态
function PagerSwap(pager,selfNode){
	if(pager == '&pager=on'){
		pager = '&pager=off';
		var img = selfNode.parentNode.getElementsByTagName('img');
		img[0].src = '../images/blue/icon_pageroff.gif';
		selfNode.childNodes[1].nodeValue = "单页"
	}else{
		pager = '&pager=on';
		var img = selfNode.parentNode.getElementsByTagName('img');
		img[0].src = '../images/blue/icon_pageron.gif';
		selfNode.childNodes[1].nodeValue = "分页";
	}
	return pager;
}

//检查非分页状态下是否显示所有数据
function isOverMax(pager,xmlObject){
	if(pager == '&pager=off'){
		var xmlDoc = xmlObject.responseXML;
		var pageBar = xmlDoc.getElementsByTagName("pageBar");
		var field = pageBar[0].getElementsByTagName("field");
		if(field[0].getAttribute("totalPageCount") != null)
			if(field[0].getAttribute("totalPageCount") == 'true')
				alert("对不起，当前数据过多，无法在非分页状态下显示所有数据。");
	}
}

//得到搜索所需要的字符串
function getSearchQuery(searchFieldName,searchValueName){
	var searchfield=document.getElementById(searchFieldName).value;
	if(searchfield==null||searchfield==""){
		//alert("请选择需要搜索的字段！");
		messageBox.alert("请选择需要搜索的字段！");
		return;
	}
	var searchvalue=document.getElementById(searchValueName).value;
	return queryString="&searchvalue="+searchvalue+"&searchfield="+searchfield;
}

//根据checkbox得到删除字符串
function getDeleteQuery(formName){
	var checkValue="checkvalue=";
	var form=document.getElementById(formName);
	var i=0;
	if(form.checkbox==undefined){
		return checkValue;
	}else if(form.checkbox.length==undefined){
		if(form.checkbox.checked==true){
			checkValue=checkValue+form.checkbox.value;
		}
	}else{
		for(i=0;i<form.checkbox.length;i++){
			if(form.checkbox[i].checked==true){
				checkValue=checkValue+form.checkbox[i].value+",";
			}
		}
	}
	return checkValue;
}

//浏览页面中点击删除后判断是否勾选数据
function isDelete(formName){
	var checkValue = getDeleteQuery(formName);
	if(checkValue == "checkvalue="){
		messageBox.alert("请选择要删除的内容","information");
	}else{
	//	$("del_mask").style.visibility='visible';
	//	$("del_massage_box").style.visibility='visible'
		messageBox.confirm("您真的要删除数据吗?",removeSelect1);
	}
}

//按字段名称进行搜索
function searchField(fieldName,fieldValue){
	document.getElementById("search").innerHTML=fieldName+" ＝";
	document.searchForm.searchfield.value=fieldValue;
}

//显示向上或向下箭头
function showArrow(fieldName,fields,order){
	for(var i=0;i<fields.length;i++){
		document.getElementById(fields[i]+"sort").innerHTML="";
	}
	if(order=="false"){
		order="true";
		document.getElementById(fieldName+"sort").innerHTML="<img src='../images/default/fresh/arrow_dowen.gif' width='10' height='10' style='margin:0 0 0 3'>";
	}else{
		order="false";
		document.getElementById(fieldName+"sort").innerHTML="<img src='../images/default/fresh/arrow_up.gif' width='10' height='10' style='margin:0 0 0 3'>";
	}
}

//打开新窗口
function openwindow(link,name,width,height){
	window.open(link,name,'status=yes,width='+width+',height='+height); 
}

//打印页面
function printMain(){
	parent.rightFrame.focus();
	parent.rightFrame.print(); 
}

//显示数据加载进度条
function selectDataLoad(){
    loading.style.display="";//显示层
    right_date.style.display="none";
	//window.setTimeout(dataData,10000);//调用显示方法
}

//其他操作时显示进度条
function selectDataLoad1(){
	loading.style.display = "";
}

//数据加载进度条显示结束
function selectDataView(){
    loading.style.display="none";//隐藏层
    right_date.style.display="";
}

//显示数据保存进度条
function insertDataLoad(){
    mask.style.visibility='visible';
    massage_box.style.visibility='visible';
	$("massage_box").style.display=""//显示层
}
function deleteDataLoad(){
	del_mask.style.visibility='visible';
	massage_box_del.style.visibility='visible';
	$("massage_box_del").style.display=""//显示层
}

//数据保存进度条显示结束
function insertDataView(){
   	$("massage_box").style.display="none";//隐藏层
   	$("massage_box_del").style.display="none";
   	//$('mask').style.display='none';
    //$('del_mask').style.display='none';
	document.getElementById("success").style.display="";
}

//验证数据是否合法
function checkData(formName){
	var form=$(formName);
	var elements = form.elements;
	var warning;
	for(var i=0;i<elements.length;i++){
		if(elements[i].check){
			var check = elements[i].check;
			var reg ;
			switch(check){
				case "notNull":
					reg = new RegExp("[^\f\n\r\t\v]","g");
					warning="字段不能为空！";
					break;
				case "number":
					reg = new RegExp(/^\d+$/g);
					warning="字段必须为数字！";
					break;
				case "isDate":
					reg = new RegExp(/^\d{4}(\-)\d{1,2}(\-)\d{1,2}$/g);
					warning="日期格式不正确!";
					break;
				case "isTime":
					reg = new RegExp(/^\d{4}(\-)\d{1,2}(\-)\d{1,2}\s\d{1,2}:\d{1,2}:(\d{1,2}|\d{1,2}\s|\d{1,2}.\d{1,2})$/g);
					warning = "时间格式不正确!";
			}
			var flag=reg.test(elements[i].value);
			if(!flag)
			{
				alert(warning);
				elements[i].focus();
				return false;
			}
		}
	}
	return true;
}

//验证数据有效性v2
function checkDataPro(formName){
	var form = document.getElementsByName(formName)[0];
	var elements = form.elements;
	var warning;
	for(var i=0;i<elements.length;++i){
		if(elements[i].notNull){
			var notNull = elements[i].notNull;
			var reg = new RegExp("[^\f\n\r\t\v]","g");

			var flag = reg.test(elements[i].value);
			if(!flag){
				alert("字段不能为空");
				//messageBox.alert("字段不能为空");
				elements[i].focus();
				return false;
			}
		}
		if(elements[i].fieldMaxLength){
			var maxLength = elements[i].fieldMaxLength;
			if(elements[i].value.length > maxLength){
				alert("字符长度不能超过"+maxLength);
				//messageBox.alert("字符长度不能超过"+maxLength);
				elements[i].focus();
				return false;
			}
		}
		if(elements[i].fieldStyle){
			var fieldStyle = elements[i].fieldStyle;
			var reg ;
			switch(fieldStyle){
				case "integer":
					reg = new RegExp(/^(-)?\d+$/g);
					warning = "字段必须为整数!";
					break;
				case "float":
					reg = new RegExp(/^((-)?\d+.\d+)|((-)?\d+)$/g);
					warning = "字段必须为数字!";
					break;
				case "date":
					reg = new RegExp(/^\d{4}(\-)\d{1,2}(\-)\d{1,2}$/g);
					warning="日期格式不正确!";
					break;
				case "datetime":
					reg = new RegExp(/^\d{4}(\-)\d{1,2}(\-)\d{1,2}\s\d{1,2}:\d{1,2}:(\d{1,2}|\d{1,2}\s|\d{1,2}.\d{1,2})$/g);
					warning = "时间格式不正确!";
			}
			var flag=reg.test(elements[i].value);
			if(!flag)
			{
				alert(warning);
				//messageBox.alert(warning);
				elements[i].focus();
				return false;
			}
		}
	}
	return true;
}

function GetCookie(sName){
    var aCookie = document.cookie.split("; ");
    for (var i=0; i < aCookie.length; i++){
        var aCrumb = aCookie[i].split("=");
        if (sName == aCrumb[0]){
            return aCrumb[1];
        }
    }
    return null;
}

function SetCookie(name, value, time, domain){
	var expdate = new Date();
	var expires = time;
	if(expires!=null){
		expdate.setTime(expdate.getTime() + ( expires * 1000 ));
		expd = "expires="+expdate.toGMTString()+";";
	}else
		expd = "";
	if (domain){
		domain = "domain="+ domain +"; path=/; ";
	}
	document.cookie = name + "=" + escape (value) + "; " + expd + domain;
}

/**
 * @param valueinput 存储要保存的文件的hidden的id
 * @param nameinput 显示上传文件的的span的id
 */
function initUpload(valueinput,nameinput){
	var valinputs = document.getElementById(valueinput).value.split(";");
	var innerhtml = "";	
	for(var i=0;i<valinputs.length;i++){
		var names = valinputs[i].split(",");
		if(names.length==2){
			innerhtml+="<span id=\""+valinputs[i]+";\"><br/>"+
			"&nbsp;<a href=\"#\" onclick=\"window.open('../util/download.jsp?path=" +
			valinputs[i]+";','','location=no,toolbar=no,status=no');\">"+names[0]+"</a> &nbsp;&nbsp;" +
			"<a href=\"#\" onclick=\"var val = document.getElementById('" +
			valueinput+"').value;document.getElementById('"+valueinput+"').value=val.substr(0,val.indexOf('" +
			valinputs[i]+";'))+''+val.substr(val.indexOf('"+valinputs[i]+";')+'" +
			valinputs[i]+";'.length);document.getElementById('"+valinputs[i] +
			";').style.display='none';\" title=\"删除\"><img src='../images/icon/upload_del.png'></a></span>"
		}
	}
	document.getElementById(nameinput).innerHTML += innerhtml;
}

function goBack(){
	var li = window.parent.topFrame.document.getElementById('current');
	if(li!=null)
		window.location = "../portal/newportal/index.jsp?menuId="+li.menuId;
	else
		winwow.location = "../portal/newportal/index.jsp?menuId=0";
}


function getQueryString(name) {
	var reg = new RegExp("(^|\\?|&)"+ name +"=([^&]*)(\\s|&|$)", "i");
	if(reg.test(location.href)) 
		return unescape(RegExp.$2.replace(/\+/g, " ")); 
	return ""; 
}

function getAttributeString(link, name) {
	var reg = new RegExp("(^|\\?|&)"+ name +"=([^&]*)(\\s|&|$)", "i");
	if(reg.test(link)) 
		return unescape(RegExp.$2.replace(/\+/g, " ")); 
	return "";
}


