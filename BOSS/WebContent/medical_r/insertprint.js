
function pageLoad(){

	XMLHttp.sendReq('GET', 'insertselectprint.do?&id='+id, '', insertselectEdit);
}

function insertselectEdit(xmlObject){
	stateResult(getActionState(xmlObject));
	
	var forms=new Array("ID","NAME","SEX","AGE","DISEASE","DISCRIBE","case_imgs","SECTION","CREATE_USER_ID","CREATE_TIME","STATE","RECIEVE_USER_ID","SOLVE_TIME","SOLVE_CONTENT","is_jump_ask");
	var rows=getServerTableRows(xmlObject);
	
	addPrintData(forms,rows);
}
