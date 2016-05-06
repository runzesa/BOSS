
function pageLoad(){

	XMLHttp.sendReq('GET', 'insertselectprint.do?&id='+id, '', insertselectEdit);
}

function insertselectEdit(xmlObject){
	stateResult(getActionState(xmlObject));
	
	var forms=new Array("id","user_id","operate_state","open_state","score","type","academic","create_user","modify_time","modify_user","department","title","audior_name","create_time","source","info","key_word","content","img_url","ucg","apply_state","rank_type","cover_img","attachment_id");
	var rows=getServerTableRows(xmlObject);
	
	addPrintData(forms,rows);
}
