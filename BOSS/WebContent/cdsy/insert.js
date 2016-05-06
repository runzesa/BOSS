   
function pageLoad(){
	setTextColor();
	initNavigation();
	
		XMLHttp.sendReq('GET', 'user_idselect.do', '', user_idselect);
		
		XMLHttp.sendReq('GET', 'typeselect.do', '', typeselect);
		
		XMLHttp.sendReq('GET', 'departmentselect.do', '', departmentselect);
		
}

function user_idselect(xmlObject){
	deleteAllOptions("user_id");
	var rows=getServerTableRows(xmlObject);
	addSelectRows("user_id",rows);
	
}
function typeselect(xmlObject){
	deleteAllOptions("type");
	var rows=getServerTableRows(xmlObject);
	addSelectRows("type",rows);
	
}
function departmentselect(xmlObject){
	deleteAllOptions("department");
	var rows=getServerTableRows(xmlObject);
	addSelectRows("department",rows);
	
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
	
	addUnescapeData(forms,rows);
	fckeditorCreate("content",400,"Default");
	
	setReadOnly(forms,true);
}


function insertselectEdit(xmlObject){
	stateResult(getActionState(xmlObject));
	var forms=new Array("id","user_id","operate_state","open_state","score","type","academic","create_user","modify_time","modify_user","department","title","audior_name","create_time","source","info","key_word","content","img_url","ucg","apply_state","rank_type","cover_img","attachment_id");
	var rows=getServerTableRows(xmlObject);
	
	addUnescapeData(forms,rows);
	fckeditorCreate("content",400,"Default");
	
	setReadOnly(forms,true);
	
	initUpload("attachment_id","attachment_idshow");	
	
}

function insertPrint(){
	window.open('insertprint.jsp?&id='+id);
}

function newData(){
	var forms=new Array("user_id","operate_state","open_state","score","type","academic","create_user","modify_time","modify_user","department","title","audior_name","create_time","source","info","key_word","content","img_url","ucg","apply_state","rank_type","cover_img","attachment_id");
	clearForm(forms);
	setReadOnly(forms,false);
	setDisabledById("save",false);
	setDisabledById("update",true);
	setDisabledById("delete",true);
	actiontype="insert";
}

function saveData(){
	if(!checkDataPro("cdsyform")){
		return;
	}
	
	var oEditor = FCKeditorAPI.GetInstance('content') ;
	var acontent=oEditor.GetXHTML();
	document.getElementById("content").value=acontent;
	
	if(actiontype=="insert"){
		var forms=new Array("user_id","operate_state","open_state","score","type","academic","create_user","modify_time","modify_user","department","title","audior_name","create_time","source","info","key_word","content","img_url","ucg","apply_state","rank_type","cover_img","attachment_id");
		setDisabledById("save",true);
		
		XMLHttp.sendReq('POST', "insertnew.do", getRequestEscapeData(forms), actionResult);
		
	}else if(actiontype=="update"){
		var forms=new Array("id","user_id","operate_state","open_state","score","type","academic","create_user","modify_time","modify_user","department","title","audior_name","create_time","source","info","key_word","content","img_url","ucg","apply_state","rank_type","cover_img","attachment_id");
		setDisabledById("save",true);
		
		XMLHttp.sendReq('POST', "insertedit.do", getRequestEscapeData(forms), actionResult);
		
	}
}

function editData(){
	var forms=new Array("id","user_id","operate_state","open_state","score","type","academic","create_user","modify_time","modify_user","department","title","audior_name","create_time","source","info","key_word","content","img_url","ucg","apply_state","rank_type","cover_img","attachment_id");
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
		var forms=new Array("id","user_id","operate_state","open_state","score","type","academic","create_user","modify_time","modify_user","department","title","audior_name","create_time","source","info","key_word","content","img_url","ucg","apply_state","rank_type","cover_img","attachment_id");
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


