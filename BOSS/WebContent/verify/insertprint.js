
function pageLoad(){

	XMLHttp.sendReq('GET', 'insertselectprint.do?&id='+id, '', insertselectEdit);
}

function insertselectEdit(xmlObject){
	stateResult(getActionState(xmlObject));
	
	var forms=new Array("id","account","name","phone_no","head_img","sex","idcard_img","id_card_no","birthday","role","register_time","is_identify","status","modify_time","point","credit","brief","cert_img","college","society","hospital","department","job_title","section","liaisons","area");
	var rows=getServerTableRows(xmlObject);
	
	addPrintData(forms,rows);
}
