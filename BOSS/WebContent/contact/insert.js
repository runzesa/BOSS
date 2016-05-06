   
function pageLoad(){
	setTextColor();
	initNavigation();
	
		XMLHttp.sendReq('GET', 'areaselect.do', '', areaselect);
		
}

function areaselect(xmlObject){
	deleteAllOptions("area");
	var rows=getServerTableRows(xmlObject);
	addSelectRows("area",rows);
	
	if(actiontype=="update"){
		XMLHttp.sendReq('GET', 'insertselectedit.do?&id='+id, '', insertselectEdit);
		setDisabledById("save",true);
	}else{
		
		XMLHttp.sendReq('GET', 'insertselectnew.do?&id='+id, '', insertselect);
		
		setDisabledById("update",true);
		setDisabledById("delete",true);
	}
	
}

function insertselect(xmlObject){
	stateResult(getActionState(xmlObject));
	var forms=new Array("id");
	var rows=getServerTableRows(xmlObject);
	
	addData(forms,rows);
	
	setReadOnly(forms,true);
}


function insertselectEdit(xmlObject){
	stateResult(getActionState(xmlObject));
	var forms=new Array("id","account","name","email","phone_no","password","old_password","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","status","modify_time","point","credit","cert_img","area");
	var rows=getServerTableRows(xmlObject);
	
	addData(forms,rows);
	
	setReadOnly(forms,true);
	
	initUpload("cert_img","cert_imgshow");	
	
}

function insertPrint(){
	window.open('insertprint.jsp?&id='+id);
}

function newData(){
	var forms=new Array("account","name","email","phone_no","password","old_password","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","status","modify_time","point","credit","cert_img","area");
	clearForm(forms);
	setReadOnly(forms,false);
	setDisabledById("save",false);
	setDisabledById("update",true);
	setDisabledById("delete",true);
	actiontype="insert";
}

function saveData(){
	if(!checkDataPro("contactform")){
		return;
	}
	
	if(actiontype=="insert"){
		var forms=new Array("account","name","email","phone_no","password","old_password","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","status","modify_time","point","credit","cert_img","area");
		setDisabledById("save",true);
		
		XMLHttp.sendReq('POST', "insertnew.do", getRequestData(forms), actionResult);
		
	}else if(actiontype=="update"){
		var forms=new Array("id","account","name","email","phone_no","password","old_password","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","status","modify_time","point","credit","cert_img","area");
		setDisabledById("save",true);
		
		XMLHttp.sendReq('POST', "insertedit.do", getRequestData(forms), actionResult);
		
	}
}

function editData(){
	var forms=new Array("id","account","name","email","phone_no","password","old_password","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","status","modify_time","point","credit","cert_img","area");
	setReadOnly(forms,false);
	setDisabledById("save",false);
	actiontype="update";
}

function deleteData(){
	messageBox.loading('del');
	XMLHttp.sendReq('POST', "delete.do", getDeleteData("id"), deleteResult);
}

function actionResult(xmlObject){
	stateResult(getActionState(xmlObject));
	var rows=getServerTableRows(xmlObject);
	var result=getActionResult(rows);
	if(result=="true"){
		messageBox.alert("数据保存成功！","success",finalResult);
		setDisabledById("save",true);
	}else if(result=="noPower"){
		messageBox.alert("您没有执行该操作的权限！","error");
	}else{
		messageBox.alert("数据保存失败！","error");
		setDisabledById("save",false);
	}
	
	//window.location.replace("index.jsp");
	
}

function deleteResult(xmlObject){
	stateResult(getActionState(xmlObject));
	var rows=getServerTableRows(xmlObject);
	var result=getActionResult(rows);
	if(result=="true"){
		messageBox.alert("数据删除成功！","success",finalResult);
		setDisabledById("save",true);
		setDisabledById("update",true);
		setDisabledById("delete",true);
		var forms=new Array("id","account","name","email","phone_no","password","old_password","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","status","modify_time","point","credit","cert_img","area");
		clearForm(forms);
	}else if(result=="noPower"){
		messageBox.alert("您没有执行该操作的权限！","error");
	}else{
		messageBox.alert("数据删除失败！","error");
	}
	
	//window.location.replace("index.jsp");
	
}

function undo(){
	window.location.replace("insert.jsp?"+encodeURI(url));
}


function finalResult(){
	
	window.location.replace("index.jsp?"+encodeURI(url));
	
}


