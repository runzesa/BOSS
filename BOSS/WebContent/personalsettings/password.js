
function update(){
	messageBox.loading("save");
	var forms=new Array("pwd_bak","pwd_new1","pwd_new2");
	XMLHttp.sendReq('POST', "updatePWD.do", getRequestEscapeData(forms), actionResult);
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
		messageBox.alert("密码错误，数据保存失败！","error");
	}
}

function finalResult(){
	window.close();
}

function checkup(){
	var pwdb = document.getElementById("pwd_bak").value;
	var pwdn1 = document.getElementById("pwd_new1").value;
	var pwdn2 = document.getElementById("pwd_new2").value;
	var pwdlen = pwdn1.length;
	var c = true;
	if (pwdb == null || pwdb == "") {
		info = "旧密码不能为空，请重新输入！";
		c = false;
	} else if (c && pwdn1 == null || pwdn1 == "") {
		info = "新密码不能为空，请重新输入！";
		c = false;
	} else if (c && pwdn2 == null || pwdn2 == "") {
		info = "新密码不能为空，请重新输入！";
		c = false;
	} else if (c && pwdn1 != pwdn2) {
		info = "新密码与确认密码不一致，请重新输入！";
		c = false;
	} else if (pwdlen<6 || pwdlen>16){
		info = "密码长度要求在6~16位之间，请重新输入！";
		c = false;
	}
	if(c==true){
		update();
	}else{
		alert(info);
	}
}