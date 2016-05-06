function pageLoad(){
	XMLHttp.sendReq('GET', 'updateUserinfoSelect.do', '', insertselectEdit);
}
function insertselectEdit(xmlObject){
	var forms=new Array("name","address","phone","mobile","email");
	var rows=getServerTableRows(xmlObject);
	addUnescapeData(forms,rows);
}

function update(){
	var forms=new Array("name","address","phone","mobile","email");
	if (checkInfo(forms)) {
		messageBox.loading("save");
		XMLHttp.sendReq('POST', "updateUserinfo.do", getRequestEscapeData(forms), actionResult);
	}
}

function checkInfo(forms){
	var name = document.getElementById(forms[0]).value;
	if(name == null || name ==''){
		alert('用户名不能为空');
		return false;
	}
	var address = document.getElementById(forms[1]).value;
	var phone = document.getElementById(forms[2]).value;
	var phoneReg =/^\d{7,8}$/;
	if(phone.length != 0 && !phoneReg.test(phone)){
		alert('请输入有效的电话号码');
		return false;
	}
	var mobile = document.getElementById(forms[3]).value;
	var mobileReg = /^1\d{10}$/;
	if(mobile.length != 0 && !mobileReg.test(mobile)){
		alert('请输入有效的手机号码');
		return false;
	}
	var email = document.getElementById(forms[4]).value;
	var emailReg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if(email.length != 0 && !emailReg.test(email)){
		alert('请输入有效的电子邮件地址');
		return false;
	}
	return true;
}

function actionResult(xmlObject){
	stateResult(getActionState(xmlObject));
	var rows=getServerTableRows(xmlObject);
	var result=getActionResult(rows);
	if(result=="true"){
		messageBox.alert("数据保存成功！","success",finalResult);
	}else if(result=="noPower"){
		messageBox.alert("您没有执行该操作的权限！","error");
	}else{
		messageBox.alert("数据保存失败！","error");
	}
}
function finalResult(){
	window.close();
}