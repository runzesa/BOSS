<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>大专家.com平台－系统管理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="../images/default/fresh/favicon.ico" rel="Shortcut Icon" />

<script src="../js/connectionpool.js" type="text/javascript"></script>
<script language="JavaScript">
	function sub(){
		var uname = document.getElementById("username").value;
		var pwd = document.getElementById("password").value;
		var rand = document.getElementById("rand").value;
		XMLHttp.sendReq('post', "login/login.do?username="+uname+"&password="+pwd+"&rand="+rand+"", '', function(xmlObj){
			var xml = xmlObj.responseXML;
			var tag0 = xml.getElementsByTagName("field")[0];
			var check = tag0.getAttribute("check");
			if(check!="true"){
				alert(check)
			}else{
				window.location="main.jsp";
			}
		});
		
	}
</script>

</head>
<body scroll="no">
<div class="login_bg">
	<div class="login_input">
		用户名：<input id="username" type="text" size="14" name="username" />
		密码：<input id="password" type="password" size="14" name="password" />
		验证码：<input id="rand" type="text" size="8" name="rand" style="width:50px;" />
		<script>document.write("<img style='border:0;vertical-align:middle;margin:0 5px 0 0;width:49px;height:21px;' src='../util/validataimage.do?rand="+Math.random()*10000+"'>");</script>
		<input type="image" border="0" name="Submitx" onclick="sub()" src="images/l_info_dl.gif" />
        <p>Copyright &copy; 2005-2013 大专家.com Team</p>
	</div>
</div>
</body>
</html>
