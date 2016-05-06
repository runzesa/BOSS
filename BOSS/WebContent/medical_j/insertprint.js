
function pageLoad(){

	XMLHttp.sendReq('GET', 'insertselectprint.do?&id='+id, '', insertselectEdit);
}

function insertselectEdit(xmlObject){
	stateResult(getActionState(xmlObject));
	
	var forms=new Array("id","case_id","user_id","content","create_time","modify_time");
	var rows=getServerTableRows(xmlObject);
	
	addPrintData(forms,rows);
}
