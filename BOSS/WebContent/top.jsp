<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.genius.util.SystemDateTime" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%String style=session.getAttribute("style")!=null?session.getAttribute("style").toString():"default/fresh";%>
<link href="css/<%=style%>/style.css" rel="stylesheet" type="text/css" />
<script src="js/connectionpool_jquery.js" type="text/javascript"></script>
<script src="js/jquery-1.4.1.js" type="text/javascript"></script>
<script src="js/login.js" type="text/javascript"></script>
<title>LiuRunze开发平台</title>
<script type="text/javascript">
	document.oncontextmenu = function(){return false;};
	var userId = '<%=session.getAttribute("userId")%>';
	if(userId == 'null'){
		alert('对不起,系统已超时。');
		parent.location.replace('login.jsp');
	}
</script>	
</head>

<body scroll="no" onload="initTitles()">
<div class="top_div">
	<div class="logo"><a href="#">&nbsp;</a></div>
	<div class="user_div">
		<div class="user">
		<h1>欢迎：<%=session.getAttribute("name")%></h1>
		<h2>
		【&nbsp;<a href="#" onclick="usersetting()">个性化设置</a>，<a href="#" onclick="quit()">退出</a>&nbsp;】
		</h2>
		<span>
		<%SystemDateTime sdt = new SystemDateTime();%>
		<%=sdt.getDateTime() %>
		</span>
		</div>
		<div class="top_nav">
			<ul id="top_nav">
				<li class="home" menuId="0" name="home" id="current"><a class="home" href="#" onclick="changeleft('首页','home');changePortal(0);"><span>首页</span></a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>
