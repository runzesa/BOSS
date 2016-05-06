<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title></title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
	function quit(){
		window.parent.location="loginout.do";
	}
	function changepwd(){
		window.parent.main.location="userinfo/password.jsp";
	}
</script>
</head>

<body scroll="no">
<div class="logo_bg1">
<div class="logo"><img src="images/logo1.gif" /></div>
<div class="denglu">当前用户：<b><%=session.getAttribute("userName") %></b>&nbsp;[&nbsp;<a href="#" onclick="quit()">退出登录 </a> | <a href="#" onclick="changepwd()">修改密码</a> ]</div>
</div>
</body>
</html>
