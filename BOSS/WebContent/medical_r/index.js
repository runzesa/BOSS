	
var order="false";
var urlPage="&pageNo=1";
var urlOrder="&order=null&ordertype="+order;
var urlSearch="&searchfield=null&searchvalue=null";
var url0="";
var pager ="&pager=on";

function pageLoad(){
	selectInit();
	initNavigation();
	var _urlOrder=getAttributeString(url, 'order');
	if(_urlOrder)urlOrder="&order="+_urlOrder+"&ordertype="+getAttributeString(url, 'ordertype');	
	var _urlSearch=getAttributeString(url, 'searchvalue');
	if(_urlSearch)urlSearch="&searchfield="+getAttributeString(url, 'searchfield')+"&searchvalue="+_urlSearch;
	var _urlPage=getAttributeString(url, 'pageNo');
	if(_urlPage)urlPage="&pageNo="+_urlPage;
	var _pager=getAttributeString(url, 'pager');
	if(_pager)pager="&pager="+_pager;
	if(url.indexOf("&url")!=-1){
		url0=url.substring(0,url.indexOf("url"));
		url=url.substring(url.indexOf("&url")+6,url.indexOf("&order"));
	}
	if(url=='null' || url=='') url='';
	else if(url.substring(0,1)!='&') url='&'+url;
	url0='url=1';
	
	XMLHttp.sendReq('GET', 'select.do?'+url0+url+urlOrder+urlSearch+urlPage+pager, '', selectdata);
}

function selectdata(xmlObject){
	selectDataLoad();
	stateResult(getActionState(xmlObject));
	deleteAllRows("selectdata");
	var rows=getServerTableRows(xmlObject);
	var visableCols=new Array(null);
	var visableObject=new Array();
	var visableData=addTableRows("selectdata",rows,"row1","row2",visableCols);
	for(var j=0;j<rows.length;j++){
		visableObject[j]=new Object();
		
	}
	for(var i=0;i<rows.length;i++){
	
		if(document.all)
			setCellLink("NAME"+i,"insert.jsp?actiontype=update&id="+document.getElementById("ID"+i).innerText+""+""
					+"&"+url0+url+urlOrder+encodeURI(urlSearch)+urlPage+pager+"","");
		else
			setCellLink("NAME"+i,"insert.jsp?actiontype=update&id="+document.getElementById("ID"+i).textContent+""+""
					+"&"+url0+url+urlOrder+encodeURI(urlSearch)+urlPage+pager+"","");
	
	}
	
	setTableCheckBox("selectdata","ID",rows.length);
	
	
	if(pager == '&pager=on'){
		addPageBar("pageBar",xmlObject);
	}else{
		noPageBar("pageBar");
		isOverMax(pager,xmlObject);
	}
	selectDataView();
	setSpaceColor();
}

function searchSelect1(){
	selectDataLoad1();
	urlSearch=getSearchQuery("searchfield","searchvalue");
	urlPage="&pageNo=1";
	XMLHttp.sendReq('POST', 'select.do?'+url0+url,urlSearch , selectdata);
}

function sort(fieldName){
	selectDataLoad1();
	var fields=new Array("NAME","SEX","AGE","DISEASE","DISCRIBE","SECTION","CREATE_USER_ID","CREATE_TIME","STATE","RECIEVE_USER_ID","SOLVE_TIME","is_jump_ask");
	if(order==null){
		order="true";
		showArrow(fieldName,fields,order);
	}else if(order=="false"){
		order="true";
		showArrow(fieldName,fields,order);
	}else{
		order="false";
		showArrow(fieldName,fields,order);
	}
	urlOrder="&order="+fieldName+"&ordertype="+order;
	XMLHttp.sendReq('GET', 'select.do?'+url0+url+urlOrder+urlSearch+urlPage+pager, null, selectdata);
}

function removeSelect1(){
	messageBox.loading("del");
	XMLHttp.sendReq('POST', "delete.do", getDeleteQuery("form1"), removeResult);
}

function extendSelect(extendurl){
	XMLHttp.sendReq('POST', extendurl, getDeleteQuery("form1"), removeResult);
}

function removeResult(){
	XMLHttp.sendReq('GET', 'select.do?'+url0+url+urlOrder+urlSearch+urlPage+pager, '', selectdata);
}

function pageTurn(link){
	selectDataLoad1();
	urlPage="&pageNo="+getAttributeString(link, "pageNo");
	XMLHttp.sendReq('GET', link, '', selectdata);
}

function pageGoTo(){
	selectDataLoad1();
	urlPage="&pageNo="+document.getElementById("pageGoNo").value;
	link='select.do?'+url0+url+urlOrder+urlSearch+urlPage+pager;
	XMLHttp.sendReq('GET', link, '', selectdata);
}

function exportReport(reportType){
	if(reportType=="excel"){
		window.open("selectExcel.do?"+url0+url+urlOrder+encodeURI(encodeURI(urlSearch))+urlPage,"selectExcel",''); 
	}else if(reportType == "word"){
		window.open("selectWord.do?"+url0+url+urlOrder+encodeURI(encodeURI(urlSearch))+urlPage,"selectPdf",'');	
	}else if(reportType=="pdf"){
		window.open("selectPdf.do?"+url0+url+urlOrder+encodeURI(encodeURI(urlSearch))+urlPage,"selectPdf",''); 
	}
}

function insertNewLink(){
	urlPage="&pageNo=1";
	window.location.replace("insert.jsp?actiontype=insert"+"&"+url+urlPage);
}

function get_type(type){
	switch(type){
		case 'id_type':
			return 'string';
		case 'NAME_type':
			return 'string';
		case 'SEX_type':
			return 'string';
		case 'AGE_type':
			return 'string';
		case 'DISEASE_type':
			return 'string';
		case 'DISCRIBE_type':
			return 'string';
		case 'SECTION_type':
			return 'string';
		case 'CREATE_USER_ID_type':
			return 'string';
		case 'CREATE_TIME_type':
			return 'string';
		case 'STATE_type':
			return 'string';
		case 'RECIEVE_USER_ID_type':
			return 'string';
		case 'SOLVE_TIME_type':
			return 'string';
		case 'is_jump_ask_type':
			return 'string';
	}
}

function pagination(selfNode){
	selectDataLoad1();
	pager = PagerSwap(pager,selfNode);
	link='select.do?'+url0+url+urlOrder+urlSearch+"&pageNo=1"+pager;
	XMLHttp.sendReq('GET', link, '', selectdata);
}


