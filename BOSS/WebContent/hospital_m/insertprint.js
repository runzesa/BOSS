
function pageLoad(){

	XMLHttp.sendReq('GET', 'insertselectprint.do?&id='+id, '', insertselectEdit);
}

function insertselectEdit(xmlObject){
	stateResult(getActionState(xmlObject));
	
	var forms=new Array("id","name","alias","content","address","province","city","level","phone");
	var rows=getServerTableRows(xmlObject);
	
	addPrintData(forms,rows);
}
