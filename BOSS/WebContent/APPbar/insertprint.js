
function pageLoad(){

	XMLHttp.sendReq('GET', 'insertselectprint.do?&id='+id, '', insertselectEdit);
}

function insertselectEdit(xmlObject){
	stateResult(getActionState(xmlObject));
	
	var forms=new Array("id","resource_id","img_url","dest_type","reource_param","resource_order","is_delete","show_type","resource_name","show_position","resource_type","crreate_time","create_user","modify_time","modify_user");
	var rows=getServerTableRows(xmlObject);
	
	addPrintData(forms,rows);
}
