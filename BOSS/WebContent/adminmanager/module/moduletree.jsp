<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>菜单管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<link href="../css/style.css" rel=stylesheet type=text/css />
	<script src="../css/jsframework.js"></script>
	<script language="JavaScript">
		<!--
		function behavior(link){
			document.form1.action=link;
			document.form1.submit();
		}
	
		function unselect(){
			var us=document.forms[0].depts;
			for (var i=0;i<us.length;i++){
				if(event.srcElement.checked){
					if(us[i].id==event.srcElement.value){
						us[i].checked=true;
					}
				}else{
					if(us[i].id==event.srcElement.value){
						us[i].checked=false;
					}
				}
			}
		}
	-->
	</script>
	<script type="text/javascript">
		var usrs=window.location.search;//获取？号后的值
		var stcstr=new Array();//定义数组保存获取的URL信息
		var stkey=new Array();
		var st=new Array();
		var stc;
		if(usrs.indexOf("?")!=-1){
			stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);//截取?号的字串
			if(stc.indexOf("&")!=-1){//处理多个参数
				stcstr=stc.split("&");  
				for(var i=0; i<stcstr.length; i++){
					stkey[i]=stcstr[i].substring(0,stcstr[i].lastIndexOf("="));//截取=号前的字串
					st[i]=stcstr[i].substring(stcstr[i].indexOf("=")+1,stcstr[i].length);//截取=号后的字串
				}
			}else{
				stc=usrs.substring(usrs.lastIndexOf("?")+1,usrs.length);//截取?号的字串
				stkey[0]=stc.substring(0,stc.lastIndexOf("="));//截取=号前的字串
				st[0]=stc.substring(stc.indexOf("=")+1,stc.length);//截取=号后的字串
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
<base target="_self" />
</head>

<body class="right_date_body">
<form method="post" action="leftdelete.do" name="form1">
<div class="cdgl_div">
	<div class="bmgl_left">
		<script language="JavaScript">
			var data={};
			data["-1_1"] = "text: /根目录; XMLData: select.do?pid=0&formname="+formName+"&nameinput="+nameInput+"&idinput="+idInput;
			Using("System.Web.UI.WebControls.MzTreeView");
			var a = new MzTreeView();
			a.dataSource = data
			a.setJsDataPath("/");
			a.setXmlDataPath("/");
			//a.rootId="1";
			a.autoSort=false;
			a.useCheckbox=false
			a.canOperate=true;
			document.write(a.render());
			a.expandLevel(1);
		</script>
	</div>
</div>
</form>
</body>
</html>

