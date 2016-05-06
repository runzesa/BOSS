<%@ page contentType="text/html; charset=gb2312"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>LiuRunze</title>
<script language="JavaScript">
	function  session(){ 
		if(<%=session.getAttribute("login")%> ==null){
			alert("对不起，系统已超时，将自动退出！");
			window.top.location.href = "../login.jsp"; 
		}else{
			self.window.location = "portal2.jsp";
		}
	}
	window.onload = session;
</script>
<script language="JavaScript">
<!--
function refresh()
{
    this.location = this.location;
}
-->
</script>
</head>
<body scroll="no">
</body>
</html>
