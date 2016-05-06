   
function pageLoad(){
	setTextColor();
	initNavigation();
	
		XMLHttp.sendReq('GET', 'hospitalselect.do', '', hospitalselect);
		
		XMLHttp.sendReq('GET', 'departmentselect.do', '', departmentselect);
		
		XMLHttp.sendReq('GET', 'job_titleselect.do', '', job_titleselect);
		
		XMLHttp.sendReq('GET', 'sectionselect.do', '', sectionselect);
		
		XMLHttp.sendReq('GET', 'liaisonsselect.do', '', liaisonsselect);
		
		XMLHttp.sendReq('GET', 'areaselect.do', '', areaselect);
		
}

function hospitalselect(xmlObject){
	deleteAllOptions("hospital");
	var rows=getServerTableRows(xmlObject);
	addSelectRows("hospital",rows);
	
}
function departmentselect(xmlObject){
	deleteAllOptions("department");
	var rows=getServerTableRows(xmlObject);
	addSelectRows("department",rows);
	
}
function job_titleselect(xmlObject){
	deleteAllOptions("job_title");
	var rows=getServerTableRows(xmlObject);
	addSelectRows("job_title",rows);
	
}
function sectionselect(xmlObject){
	deleteAllOptions("section");
	var rows=getServerTableRows(xmlObject);
	addSelectRows("section",rows);
	
}
function liaisonsselect(xmlObject){
	deleteAllOptions("liaisons");
	var rows=getServerTableRows(xmlObject);
	addSelectRows("liaisons",rows);
	
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
	
	addUnescapeData(forms,rows);
	fckeditorCreate("brief",400,"Default");
	
	setReadOnly(forms,true);
}


function insertselectEdit(xmlObject){
	stateResult(getActionState(xmlObject));
	var forms=new Array("id","account","name","phone_no","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","status","modify_time","point","credit","brief","cert_img","college","society","hospital","department","job_title","section","liaisons","area");
	var rows=getServerTableRows(xmlObject);
	
	addUnescapeData(forms,rows);
	fckeditorCreate("brief",400,"Default");
	
	setReadOnly(forms,true);
	
	initUpload("cert_img","cert_imgshow");	
	
}

function insertPrint(){
	window.open('insertprint.jsp?&id='+id);
}

function newData(){
	var forms=new Array("account","name","phone_no","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","status","modify_time","point","credit","brief","cert_img","college","society","hospital","department","job_title","section","liaisons","area");
	clearForm(forms);
	setReadOnly(forms,false);
	setDisabledById("save",false);
	setDisabledById("update",true);
	setDisabledById("delete",true);
	actiontype="insert";
}

function saveData(){
	if(!checkDataPro("verifyform")){
		return;
	}
	
	var oEditor = FCKeditorAPI.GetInstance('brief') ;
	var acontent=oEditor.GetXHTML();
	document.getElementById("brief").value=acontent;
	
	if(actiontype=="insert"){
		var forms=new Array("account","name","phone_no","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","status","modify_time","point","credit","brief","cert_img","college","society","hospital","department","job_title","section","liaisons","area");
		setDisabledById("save",true);
		
		XMLHttp.sendReq('POST', "insertnew.do", getRequestEscapeData(forms), actionResult);
		
	}else if(actiontype=="update"){
		var forms=new Array("id","account","name","phone_no","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","status","modify_time","point","credit","brief","cert_img","college","society","hospital","department","job_title","section","liaisons","area");
		setDisabledById("save",true);
		
		XMLHttp.sendReq('POST', "insertedit.do", getRequestEscapeData(forms), actionResult);
		
	}
}

function editData(){
	var forms=new Array("id","account","name","phone_no","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","status","modify_time","point","credit","brief","cert_img","college","society","hospital","department","job_title","section","liaisons","area");
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
		messageBox.alert("���ݱ���ɹ���","success",finalResult);
		setDisabledById("save",true);
	}else if(result=="noPower"){
		messageBox.alert("��û��ִ�иò�����Ȩ�ޣ�","error");
	}else{
		messageBox.alert("���ݱ���ʧ�ܣ�","error");
		setDisabledById("save",false);
	}
	
	//window.location.replace("index.jsp");
	
}

function deleteResult(xmlObject){
	stateResult(getActionState(xmlObject));
	var rows=getServerTableRows(xmlObject);
	var result=getActionResult(rows);
	if(result=="true"){
		messageBox.alert("����ɾ���ɹ���","success",finalResult);
		setDisabledById("save",true);
		setDisabledById("update",true);
		setDisabledById("delete",true);
		var forms=new Array("id","account","name","phone_no","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","status","modify_time","point","credit","brief","cert_img","college","society","hospital","department","job_title","section","liaisons","area");
		clearForm(forms);
	}else if(result=="noPower"){
		messageBox.alert("��û��ִ�иò�����Ȩ�ޣ�","error");
	}else{
		messageBox.alert("����ɾ��ʧ�ܣ�","error");
	}
	
	//window.location.replace("index.jsp");
	
}

function undo(){
	window.location.replace("insert.jsp?"+encodeURI(url));
}


function finalResult(){
	
	window.location.replace("index.jsp?"+encodeURI(url));
	
}


