   
function pageLoad(){
	setTextColor();
	initNavigation();
	
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
	var forms=new Array("id","resource_id","img_url","dest_type","reource_param","resource_order","is_delete","show_type","resource_name","show_position","resource_type","crreate_time","create_user","modify_time","modify_user");
	var rows=getServerTableRows(xmlObject);
	
	addData(forms,rows);
	
	setReadOnly(forms,true);
	
	initUpload("img_url","img_urlshow");	
	
}

function insertPrint(){
	window.open('insertprint.jsp?&id='+id);
}

function newData(){
	var forms=new Array("resource_id","img_url","dest_type","reource_param","resource_order","is_delete","show_type","resource_name","show_position","resource_type","crreate_time","create_user","modify_time","modify_user");
	clearForm(forms);
	setReadOnly(forms,false);
	setDisabledById("save",false);
	setDisabledById("update",true);
	setDisabledById("delete",true);
	actiontype="insert";
}

function saveData(){
	if(!checkDataPro("PCbarform")){
		return;
	}
	
	if(actiontype=="insert"){
		var forms=new Array("resource_id","img_url","dest_type","reource_param","resource_order","is_delete","show_type","resource_name","show_position","resource_type","crreate_time","create_user","modify_time","modify_user");
		setDisabledById("save",true);
		
		XMLHttp.sendReq('POST', "insertnew.do", getRequestData(forms), actionResult);
		
	}else if(actiontype=="update"){
		var forms=new Array("id","resource_id","img_url","dest_type","reource_param","resource_order","is_delete","show_type","resource_name","show_position","resource_type","crreate_time","create_user","modify_time","modify_user");
		setDisabledById("save",true);
		
		XMLHttp.sendReq('POST', "insertedit.do", getRequestData(forms), actionResult);
		
	}
}

function editData(){
	var forms=new Array("id","resource_id","img_url","dest_type","reource_param","resource_order","is_delete","show_type","resource_name","show_position","resource_type","crreate_time","create_user","modify_time","modify_user");
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
		var forms=new Array("id","resource_id","img_url","dest_type","reource_param","resource_order","is_delete","show_type","resource_name","show_position","resource_type","crreate_time","create_user","modify_time","modify_user");
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


