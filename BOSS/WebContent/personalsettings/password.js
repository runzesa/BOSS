
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
		messageBox.alert("���ݱ���ɹ���","success",finalResult);
	}else if(result=="noPower"){
		messageBox.alert("��û��ִ�иò�����Ȩ�ޣ�","error");
	}else{
		messageBox.alert("����������ݱ���ʧ�ܣ�","error");
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
		info = "�����벻��Ϊ�գ����������룡";
		c = false;
	} else if (c && pwdn1 == null || pwdn1 == "") {
		info = "�����벻��Ϊ�գ����������룡";
		c = false;
	} else if (c && pwdn2 == null || pwdn2 == "") {
		info = "�����벻��Ϊ�գ����������룡";
		c = false;
	} else if (c && pwdn1 != pwdn2) {
		info = "��������ȷ�����벻һ�£����������룡";
		c = false;
	} else if (pwdlen<6 || pwdlen>16){
		info = "���볤��Ҫ����6~16λ֮�䣬���������룡";
		c = false;
	}
	if(c==true){
		update();
	}else{
		alert(info);
	}
}