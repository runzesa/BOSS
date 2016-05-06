//ɾ�������б���������
function deleteAllOptions(selectName){
//	var result=document.getElementById(selectName);
//	while(result.childNodes.length>0){
//		result.removeChild(result.childNodes[0]);
//	}
	var result = $("#"+selectName);
	result.empty();
}

//Ϊ�����б������У�����ָ�������ݼ��뵽���У�DataΪ��XML��װ��data���ݰ�
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

//����ָ��������Ԫ�ؼ�xml���ݼ������������
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

//����ָ��������Ԫ�ؼ�xml���ݼ����insertprint.js
function addPrintData(forms,rows){
	var field=rows[0].getElementsByTagName("field");
	for(var i=0;i<forms.length;i++){
		document.getElementById(forms[i]).innerHTML=unescapeData(field[i].getAttribute("value"));
	}

}

//����ָ��������Ԫ�ؼ�xml���ݼ�����������䣬�������б�������ݽ��н���
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

//����ָ����radio��ť�����Ƽ�radio��ť��ֵ������Ӧ�İ�ťΪѡ��״̬
function setRadioValue(radioName,radioValue){
	var radios=document.getElementsByName(radioName);
	for(var i=0;i<radios.length;i++){
		if(radios[i].value==radioValue){
			radios[i].checked=true;
			break;
		}
	}
}

//�õ�insert��update�Ľ��
function getActionResult(rows){
	var field=rows[0].getElementsByTagName("field");
	return field[0].getAttribute("value");
}

//���forms����ָ����Ԫ��
function clearForm(forms){
	for(var i=0;i<forms.length;i++){
		document.getElementById(forms[i]).value="";
	}
}


//��ָ��forms�����ڵ�Ԫ����Ϊֻ��,statusΪtrueΪֻ����ΪfalseΪ�ɶ�
function setReadOnly(forms,status){
	for(var i=0;i<forms.length;i++){
		document.getElementById(forms[i]).readOnly=status;
	}
}

//��ָ��Ԫ����Ϊ�����ã�statusΪtrueΪ�����ã�ΪfalseΪ����
function setDisabled(element,status){
	if(document.getElementById(element)!=null)
		document.getElementById(element).disabled=status;
}

//����ָ��������ò˵���ť�Ƿ����
function setDisabledByNum(num,status){
	var li = $('.right_date_top_nav >ul >li a').get(num);
	li.disabled = status;
}
	
//����ָ��id���ò˵���ť�Ƿ����
function setDisabledById(id,status){
	$('#'+id).get(0).disabled = status;
}

//����ָ����forms����õ�׼���ύ�Ĳ���
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

//����ָ����forms����õ�׼���ύ�Ĳ��������Բ������б��룬�޸����е������ַ�
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

//����ָ����radio��ť�����Ʒ���ѡ�е�radio��ť��ֵ
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

//����ָ���������������ݿ�id�õ�׼��ɾ���Ĳ���
function getDeleteData(id){
	return "&checkvalue="+document.getElementById(id).value;
}

//����������ѡ�е�������ʾ��Ӧ��div������div����������������div
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

//����fckeditor�༭��textareaNameΪ��Ӧ��textarea������
function fckeditorCreate(textareaName,height,toolbarSet){
	var oFCKeditor = new FCKeditor(textareaName) ;
	oFCKeditor.BasePath = "../FCKeditor/" ;
	oFCKeditor.Height = height;
	oFCKeditor.ToolbarSet = toolbarSet;
	oFCKeditor.ReplaceTextarea();
}

//���ύ�ĵ������ʽ�����ݽ��б��룬�޸������ַ������磬��"&"���б���
function escapeData(dataString){
	var result;
	result=dataString.replace(/\&/g,escape("&"));
	return result;
}

//�Խ��й���������ݽ��н���
function unescapeData(dataString){
	return unescape(dataString);
}

//���ñ༭ҳ���ı�����ʽ
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