   
function pageLoad(){
	setTextColor();
	initNavigation();

		XMLHttp.sendReq('GET', 'job_titleselect.do', '', job_titleselect);
		
		XMLHttp.sendReq('GET', 'sectionselect.do', '', sectionselect);
		
		XMLHttp.sendReq('GET', 'area_sselect.do', '', area_sselect);
		
		XMLHttp.sendReq('GET', 'areaselect.do', '', areaselect);
}

function area_sselect(xmlObject){
	deleteAllOptions("area_s");
	var rows=getServerTableRows(xmlObject);
	addSelectRows("area_s",rows);
	
}

function areaskselect(xmlObject){
	deleteAllOptions("areask");
	var rows=getServerTableRows(xmlObject);
	addSelectRows("areask",rows);
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
	var forms=new Array("account","name","email","phone_no","password","old_password","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","preference","status","modify_time","point","credit","brief","skilled_fields","cert_img","college","society","hospital","department","job_title","section","liaisons","areask");
	var rows=getServerTableRows(xmlObject);
	
	addDataId(forms,rows);
	
	setReadOnly(forms,true);
	
	initUpload("cert_img","cert_imgshow");	
	
}

function insertPrint(){
	window.open('insertprint.jsp?&id='+id);
}

function newData(){
	var forms=new Array("account","name","email","phone_no","password","old_password","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","preference","status","modify_time","point","credit","brief","skilled_fields","cert_img","college","society","hospital","department","job_title","section","liaisons","areask");
	clearForm(forms);
	setReadOnly(forms,false);
	setDisabledById("save",false);
	setDisabledById("update",true);
	setDisabledById("delete",true);
	actiontype="insert";
}

function saveData(){
	if(!checkDataPro("b_userform")){
		return;
	}
	
	if(actiontype=="insert"){
		var forms=new Array("account","name","email","phone_no","password","old_password","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","preference","status","modify_time","point","credit","brief","skilled_fields","cert_img","college","society","hospital","department","job_title","section","liaisons","areask");
		setDisabledById("save",true);
		
		XMLHttp.sendReq('POST', "insertnew.do", getRequestData(forms), actionResult);
		
	}else if(actiontype=="update"){
		var forms=new Array("id","account","name","email","phone_no","password","old_password","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","preference","status","modify_time","point","credit","brief","skilled_fields","cert_img","college","society","hospital","department","job_title","section","liaisons","areask");
		setDisabledById("save",true);
		
		XMLHttp.sendReq('POST', "insertedit.do", getRequestData(forms), actionResult);
		
	}
}

function editData(){
	var forms=new Array("id","account","name","email","phone_no","password","old_password","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","preference","status","modify_time","point","credit","brief","skilled_fields","cert_img","college","society","hospital","department","job_title","section","liaisons","areask");
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
		messageBox.alert("��ݱ���ɹ���","success",finalResult);
		setDisabledById("save",true);
	}else if(result=="noPower"){
		messageBox.alert("��û��ִ�иò�����Ȩ�ޣ�","error");
	}else{
		messageBox.alert("��ݱ���ʧ�ܣ�","error");
		setDisabledById("save",false);
	}
	
	//window.location.replace("index.jsp");
	
}

function deleteResult(xmlObject){
	stateResult(getActionState(xmlObject));
	var rows=getServerTableRows(xmlObject);
	var result=getActionResult(rows);
	if(result=="true"){
		messageBox.alert("���ɾ��ɹ���","success",finalResult);
		setDisabledById("save",true);
		setDisabledById("update",true);
		setDisabledById("delete",true);
		var forms=new Array("id","account","name","email","phone_no","password","old_password","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","preference","status","modify_time","point","credit","brief","skilled_fields","cert_img","college","society","hospital","department","job_title","section","liaisons","areask");
		clearForm(forms);
	}else if(result=="noPower"){
		messageBox.alert("��û��ִ�иò�����Ȩ�ޣ�","error");
	}else{
		messageBox.alert("���ɾ��ʧ�ܣ�","error");
	}
	
	//window.location.replace("index.jsp");
	
}

function undo(){
	window.location.replace("insert.jsp?"+encodeURI(url));
}


function finalResult(){
	
	window.location.replace("index.jsp?"+encodeURI(url));
	
}

//级联下拉，当省改变时，改变市和医学联络员
function area_sChange()
{
	var pid = document.getElementById("area_s").value;
	XMLHttp.sendReq('GET', 'areaselect.do?pid='+pid, '', areaskselect);
    XMLHttp.sendReq('GET', 'liaisonsselect.do?pid='+pid, '', liaisonsselect);
}

//级联下拉，当市改变时，改变医院
function cityChange()
{
    var shi = document.getElementById("areask").value;
	
	XMLHttp.sendReq('GET', 'hospitalselect.do?shi='+shi, '', hospitalselect);	
}

//级联下拉，当医院改变时，改变科室
/**
function hospitalChange()
{
	var pname = document.getElementById("hospital").value;
	pname = encodeURI(pname);
	XMLHttp.sendReq('GET','departmentselect.do?pname='+pname, '', departmentselect);
}
**/

//编辑页面误生成ID专用
function addDataId(forms,rows){
	/**
	var field=rows[0].getElementsByTagName("field");
	for(var i=0;i<forms.length;i++){
		if(document.getElementById(forms[i]).type=="radio"){
			setRadioValue(forms[i],field[i+1].getAttribute("value"));
		}else{
			document.getElementById(forms[i]).value=field[i+1].getAttribute("value");
		}                                     
	}**/

	var field = $(rows[0]).find("field");
	$(forms).each(function(i){
		var obj = $("#"+this)
		if(obj[0].tagName.toLowerCase()=="radio"){
			setRadioValue(this,$(field[i+1]).attr("value"));
		}else{
			
			obj.val($(field[i+1]).attr("value"));
		}
	});
}