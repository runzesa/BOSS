
//���õõ����ݵĿ�ݷ�ʽ
$ = function(id){
	return document.getElementById(id);
}

//�õ����������ص�������
function getServerTableRows(xmlObject){
	var xmlDoc=xmlObject.responseXML;
	var rows=xmlDoc.getElementsByTagName("row");
	return rows;
}

//�õ�������Action��״̬������session�Ƿ�ʧЧ��
function getActionState(xmlObject){
	var xmlDoc=xmlObject.responseXML;
	var actionState=xmlDoc.getElementsByTagName("actionState");
	var field=actionState[0].getElementsByTagName("field");
	return field[0].getAttribute("value");
}

//���ݷ�����״̬������ҳ����ת
function stateResult(actionState){
	if(actionState=="noSession"){
		alert("�Բ���ϵͳ�ѳ�ʱ��");
		parent.window.location = "../login.jsp";
	}else if(actionState=="NullPointerException"){
		alert("�Բ���ϵͳ�����ڲ���������ϵͳ����Ա��ϵ��");
		parent.window.location = "../login.jsp";
	}
}

//���ӹ���������
function addPageBar(barName,xmlObject){
	if(barName!=null){
		var xmlDoc=xmlObject.responseXML;
		var pageBar=xmlDoc.getElementsByTagName("pageBar");
		var field=pageBar[0].getElementsByTagName("field");
		document.getElementById(barName).innerHTML=field[0].getAttribute("value");
		document.getElementById('pagergo').style.display = 'block';
	}
}

//�رշ�ҳ���غ�ȡ��pagebar����ʾ
function noPageBar(barName){
	if(barName!=null){
		document.getElementById(barName).innerHTML = '';
		document.getElementById('pagergo').style.display = 'none';
	}
}

//�л���ҳ״̬
function PagerSwap(pager,selfNode){
	if(pager == '&pager=on'){
		pager = '&pager=off';
		var img = selfNode.parentNode.getElementsByTagName('img');
		img[0].src = '../images/blue/icon_pageroff.gif';
		selfNode.childNodes[1].nodeValue = "��ҳ"
	}else{
		pager = '&pager=on';
		var img = selfNode.parentNode.getElementsByTagName('img');
		img[0].src = '../images/blue/icon_pageron.gif';
		selfNode.childNodes[1].nodeValue = "��ҳ";
	}
	return pager;
}

//���Ƿ�ҳ״̬���Ƿ���ʾ��������
function isOverMax(pager,xmlObject){
	if(pager == '&pager=off'){
		var xmlDoc = xmlObject.responseXML;
		var pageBar = xmlDoc.getElementsByTagName("pageBar");
		var field = pageBar[0].getElementsByTagName("field");
		if(field[0].getAttribute("totalPageCount") != null)
			if(field[0].getAttribute("totalPageCount") == 'true')
				alert("�Բ��𣬵�ǰ���ݹ��࣬�޷��ڷǷ�ҳ״̬����ʾ�������ݡ�");
	}
}

//�õ���������Ҫ���ַ���
function getSearchQuery(searchFieldName,searchValueName){
	var searchfield=document.getElementById(searchFieldName).value;
	if(searchfield==null||searchfield==""){
		//alert("��ѡ����Ҫ�������ֶΣ�");
		messageBox.alert("��ѡ����Ҫ�������ֶΣ�");
		return;
	}
	var searchvalue=document.getElementById(searchValueName).value;
	return queryString="&searchvalue="+searchvalue+"&searchfield="+searchfield;
}

//����checkbox�õ�ɾ���ַ���
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

//���ҳ���е��ɾ�����ж��Ƿ�ѡ����
function isDelete(formName){
	var checkValue = getDeleteQuery(formName);
	if(checkValue == "checkvalue="){
		messageBox.alert("��ѡ��Ҫɾ��������","information");
	}else{
	//	$("del_mask").style.visibility='visible';
	//	$("del_massage_box").style.visibility='visible'
		messageBox.confirm("�����Ҫɾ��������?",removeSelect1);
	}
}

//���ֶ����ƽ�������
function searchField(fieldName,fieldValue){
	document.getElementById("search").innerHTML=fieldName+" ��";
	document.searchForm.searchfield.value=fieldValue;
}

//��ʾ���ϻ����¼�ͷ
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

//���´���
function openwindow(link,name,width,height){
	window.open(link,name,'status=yes,width='+width+',height='+height); 
}

//��ӡҳ��
function printMain(){
	parent.rightFrame.focus();
	parent.rightFrame.print(); 
}

//��ʾ���ݼ��ؽ�����
function selectDataLoad(){
    loading.style.display="";//��ʾ��
    right_date.style.display="none";
	//window.setTimeout(dataData,10000);//������ʾ����
}

//��������ʱ��ʾ������
function selectDataLoad1(){
	loading.style.display = "";
}

//���ݼ��ؽ�������ʾ����
function selectDataView(){
    loading.style.display="none";//���ز�
    right_date.style.display="";
}

//��ʾ���ݱ��������
function insertDataLoad(){
    mask.style.visibility='visible';
    massage_box.style.visibility='visible';
	$("massage_box").style.display=""//��ʾ��
}
function deleteDataLoad(){
	del_mask.style.visibility='visible';
	massage_box_del.style.visibility='visible';
	$("massage_box_del").style.display=""//��ʾ��
}

//���ݱ����������ʾ����
function insertDataView(){
   	$("massage_box").style.display="none";//���ز�
   	$("massage_box_del").style.display="none";
   	//$('mask').style.display='none';
    //$('del_mask').style.display='none';
	document.getElementById("success").style.display="";
}

//��֤�����Ƿ�Ϸ�
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
					warning="�ֶβ���Ϊ�գ�";
					break;
				case "number":
					reg = new RegExp(/^\d+$/g);
					warning="�ֶα���Ϊ���֣�";
					break;
				case "isDate":
					reg = new RegExp(/^\d{4}(\-)\d{1,2}(\-)\d{1,2}$/g);
					warning="���ڸ�ʽ����ȷ!";
					break;
				case "isTime":
					reg = new RegExp(/^\d{4}(\-)\d{1,2}(\-)\d{1,2}\s\d{1,2}:\d{1,2}:(\d{1,2}|\d{1,2}\s|\d{1,2}.\d{1,2})$/g);
					warning = "ʱ���ʽ����ȷ!";
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

//��֤������Ч��v2
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
				alert("�ֶβ���Ϊ��");
				//messageBox.alert("�ֶβ���Ϊ��");
				elements[i].focus();
				return false;
			}
		}
		if(elements[i].fieldMaxLength){
			var maxLength = elements[i].fieldMaxLength;
			if(elements[i].value.length > maxLength){
				alert("�ַ����Ȳ��ܳ���"+maxLength);
				//messageBox.alert("�ַ����Ȳ��ܳ���"+maxLength);
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
					warning = "�ֶα���Ϊ����!";
					break;
				case "float":
					reg = new RegExp(/^((-)?\d+.\d+)|((-)?\d+)$/g);
					warning = "�ֶα���Ϊ����!";
					break;
				case "date":
					reg = new RegExp(/^\d{4}(\-)\d{1,2}(\-)\d{1,2}$/g);
					warning="���ڸ�ʽ����ȷ!";
					break;
				case "datetime":
					reg = new RegExp(/^\d{4}(\-)\d{1,2}(\-)\d{1,2}\s\d{1,2}:\d{1,2}:(\d{1,2}|\d{1,2}\s|\d{1,2}.\d{1,2})$/g);
					warning = "ʱ���ʽ����ȷ!";
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
 * @param valueinput �洢Ҫ������ļ���hidden��id
 * @param nameinput ��ʾ�ϴ��ļ��ĵ�span��id
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
			";').style.display='none';\" title=\"ɾ��\"><img src='../images/icon/upload_del.png'></a></span>"
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


