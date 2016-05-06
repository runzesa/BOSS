<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../jspheader/insert_header.jsp" %>
<title>更改您的个人资料</title>
<script type="text/javascript" src="userinfo.js"></script>
</head>
<body class="userinfo_body" onload="pageLoad()">
<div id="message_box"></div>
<form action="" method="post">
	<div class="userinfo_div">
		<div class="userinfo_title"><h1>个人资料</h1><span>(更改您的姓名、地址和其它个人信息)</span></div>
		<div class="userinfo_input">
			姓&nbsp;名：<input name="name" id="name" type="text"/><br/><br/>
			住&nbsp;址：<input name="address" id="address" type="text"/><br/><br/>
			手&nbsp;机：<input name="mobile" id="mobile" type="text"/><br/><br/>
			固定电话：<input name="phone" id="phone" type="text"/><br/><br/>
			电子邮件：<input name="email" id="email" type="text"/></div>
		<div class="userinfo_btns">
			<input name="Submit" type="button" onclick="update()" class="btn" value="修改" />
			<input name="Submit2" type="button" onclick="window.close()" class="btn" value="取消" />
		</div>
	</div>
</form>
</body>
</html>
