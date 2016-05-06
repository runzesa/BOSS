//删除下拉列表中所有行
function deleteAllOptions(selectName){
//	var result=document.getElementById(selectName);
//	while(result.childNodes.length>0){
//		result.removeChild(result.childNodes[0]);
//	}
	var result = $("#"+selectName);
	result.empty();
}

//为下拉列表增加行，并将指定的数据加入到该行，Data为以XML包装的data数据包
function addSelectRows(selectName,data){
	/*
	var select=document.getElementById(selectName);
	for(var i=0;i<data.length;i++){
		var field=data[i].getElementsByTagName("field");
		var option=document.createElement("option");
		option.setAttribute("value",field[0].getAttribute("value"));
		var textNode=document.createTextNode(field[1].getAttribute("value"));
		option.appendChild(textNode);
		select.appendChild(option);
	}
	*/
	var select=$("#"+selectName);
	$(data).each(function(){
		var field = $(this).find("field");
		var option = $("<option/>").val($(field[0]).attr("value")).text($(field[1]).attr("value"));
		select.append(option);
	});
}

//根据指定的数组元素及xml数据集进行数据填充
function addData(forms,rows){
/**	var field=rows[0].getElementsByTagName("field");
	for(var i=0;i<forms.length;i++){
		if(document.getElementById(forms[i]).type=="radio"){
			setRadioValue(forms[i],field[i].getAttribute("value"));
		}else{
			document.getElementById(forms[i]).value=field[i].getAttribute("value");
		}
	}**/
	var field = $(rows[0]).find("field");
	$(forms).each(function(i){
		var obj = $("#"+this)
		if(obj[0].tagName.toLowerCase()=="radio"){
			setRadioValue(this,$(field[i]).attr("value"));
		}else{
			obj.val($(field[i]).attr("value"));
		}
	});
}

//根据指定的数组元素及xml数据集填充insertprint.js
function addPrintData(forms,rows){
	var field=rows[0].getElementsByTagName("field");
	for(var i=0;i<forms.length;i++){
		document.getElementById(forms[i]).innerHTML=unescapeData(field[i].getAttribute("value"));
	}

}

//根据指定的数组元素及xml数据集进行数据填充，并对其中编码的数据进行解码
function addUnescapeData(forms,rows){
	var field=rows[0].getElementsByTagName("field");
	for(var i=0;i<forms.length;i++){
		if(document.getElementById(forms[i]).type=="radio"){
			setRadioValue(forms[i],field[i].getAttribute("value"));
		}else{
			document.getElementById(forms[i]).value=unescapeData(field[i].getAttribute("value"));
		}
	}
}

//根据指定的radio按钮的名称及radio按钮的值设置相应的按钮为选中状态
function setRadioValue(radioName,radioValue){
	var radios=document.getElementsByName(radioName);
	for(var i=0;i<radios.length;i++){
		if(radios[i].value==radioValue){
			radios[i].checked=true;
			break;
		}
	}
}

//得到insert或update的结果
function getActionResult(rows){
	var field=rows[0].getElementsByTagName("field");
	return field[0].getAttribute("value");
}

//清空forms数组指定的元素
function clearForm(forms){
	for(var i=0;i<forms.length;i++){
		document.getElementById(forms[i]).value="";
	}
}


//将指定forms数组内的元素设为只读,status为true为只读，为false为可读
function setReadOnly(forms,status){
	for(var i=0;i<forms.length;i++){
		document.getElementById(forms[i]).readOnly=status;
	}
}

//将指定元素设为不可用，status为true为不可用，为false为可用
function setDisabled(element,status){
	if(document.getElementById(element)!=null)
		document.getElementById(element).disabled=status;
}

//根据指定序号设置菜单按钮是否可用
function setDisabledByNum(num,status){
	var li = $('.right_date_top_nav >ul >li a').get(num);
	li.disabled = status;
}
	
//根据指定id设置菜单按钮是否可用
function setDisabledById(id,status){
	$('#'+id).get(0).disabled = status;
}

//根据指定的forms数组得到准备提交的参数
function getRequestData(forms){
	var requestData;
	for(var i=0;i<forms.length;i++){
		var formsValue="";
		if(document.getElementById(forms[i]).type=="radio"){
			formsValue=getRadioValue(forms[i]);
		}else{
			formsValue=document.getElementById(forms[i]).value;
		}
		requestData=requestData+"&"+forms[i]+"="+formsValue;
	}
	return requestData;
}

//根据指定的forms数组得到准备提交的参数，并对参数进行编码，修改其中的特殊字符
function getRequestEscapeData(forms){
	var requestData;
	for(var i=0;i<forms.length;i++){
		var formsValue="";
		if(document.getElementById(forms[i]).type=="radio"){
			formsValue=getRadioValue(forms[i]);
		}else{
			formsValue=document.getElementById(forms[i]).value;
		}
		requestData=requestData+"&"+forms[i]+"="+escapeData(formsValue);
	}
	return requestData;
}

//根据指定的radio按钮的名称返回选中的radio按钮的值
function getRadioValue(radioName){
	var radios=document.getElementsByName(radioName);
	var radioValue="";
	for(var i=0;i<radios.length;i++)
	{
		if(radios[i].checked)
		{
			radioValue=radios[i].value;
			break;
		}
	}
	return radioValue;
}

//根据指定的主键所在数据框id得到准备删除的参数
function getDeleteData(id){
	return "&checkvalue="+document.getElementById(id).value;
}

//根据下拉框被选中的索引显示相应的div，根据div的数量隐藏其他的div
function changeDisplay(formName,selectName,divNumber){
	var selectInput=document.forms[formName].elements[selectName];
	var indexNumber=selectInput.selectedIndex+1;
	for(var i=1;i<=divNumber;i++){
		if(i!=indexNumber){
			document.getElementById("displayDiv"+i).style.display = "none";
		}
	}
	document.getElementById("displayDiv"+indexNumber).style.display = "block";
}

//生成fckeditor编辑框，textareaName为对应的textarea的名称
function fckeditorCreate(textareaName,height,toolbarSet){
	var oFCKeditor = new FCKeditor(textareaName) ;
	oFCKeditor.BasePath = "../FCKeditor/" ;
	oFCKeditor.Height = height;
	oFCKeditor.ToolbarSet = toolbarSet;
	oFCKeditor.ReplaceTextarea();
}

//对提交的的特殊格式的数据进行编码，修改特殊字符，例如，将"&"进行编码
function escapeData(dataString){
	var result;
	result=dataString.replace(/\&/g,escape("&"));
	return result;
}

//对进行过编码的数据进行解码
function unescapeData(dataString){
	return unescape(dataString);
}

//设置编辑页面文本框样式
function setTextColor(){
	$('input:text').each(function(){
		$(this).focus(function(){
			this.className = 'input_on';
			$(this).unbind('mouseout');
		}); 
		$(this).blur(function(){
			this.className = 'input_off';
			$(this).mouseout(function(){
				this.className = 'input_out';
			});
		});
		$(this).mousemove(function(){
			this.className = 'input_move';
		});
		$(this).mouseout(function(){
			this.className = 'input_out';
		});
	});
}