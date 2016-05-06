<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>用户列表</title>
<link href="../adminmanager/css/style.css" rel=stylesheet type=text/css>
	<script src="../adminmanager/css/jsframework.js"></script>
<script language="JavaScript">
<!--
function behavior(link){
	document.form1.action=link;
	document.form1.submit();
}

function unselect(){
	var us=document.forms[0].user;
	
	for (var i=0;i<us.length;i++){
		if(event.srcElement.checked){
			if(us[i].id==event.srcElement.value){
				us[i].checked=true;
			}
		}
		else{
			if(us[i].id==event.srcElement.value){
				us[i].checked=false;
			}
		}
	}
}
-->
</script>
<script type="text/javascript">
	var usrs=window.location.search;
	var stcstr=new Array();
	var stkey=new Array();
	var st=new Array();
	var stc;
	if(usrs.indexOf("?")!=-1){
		stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);
		if(stc.indexOf("&")!=-1){
			stcstr=stc.split("&");  
			for(var i=0; i<stcstr.length; i++){
				stkey[i]=stcstr[i].substring(0,stcstr[i].lastIndexOf("="));
				st[i]=stcstr[i].substring(stcstr[i].indexOf("=")+1,stcstr[i].length);
			}
		}else{
			stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);
			stkey[0]=stc.substring(0,stc.lastIndexOf("="));
			st[0]=stc.substring(stc.indexOf("=")+1,stc.length);
		}
	}
	var formName;
	var nameInput;
	var idInput;
	for(var i=0;i<stkey.length;i++){
		if(stkey[i]=="formname"){
			formName=st[i];
		}else if(stkey[i]=="nameinput"){
			nameInput=st[i];
		}else if(stkey[i]=="idinput"){
			idInput=st[i];
		}
	}
</script>

<base target="_self">
</head>

<body  class="right_date_body">
	<form method="post" action="usertreeok.jsp" name="form1">
		<div class="bmgl_div">
		<div class="open_left">
		

		<script LANGUAGE="JavaScript">
			var u = "usertree.do?act=0&formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput;
			var data={};
			data["-1_1"] = "text: /根部门; XMLData: "+u;
			Using("System.Web.UI.WebControls.MzTreeView");
			var a = new MzTreeView();
			a.dataSource = data
			a.setJsDataPath("/");
			a.setXmlDataPath("/");
			//a.rootId="1";
			a.autoSort=false;
			a.useCheckbox=false;
			a.canOperate=true;
			document.write(a.render());
			a.expandLevel(1);
		</script>
	</div>
	</div>
</form>
</body>

</html>
